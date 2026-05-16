import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Math;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class SkeletonAutomaticView extends WatchUi.WatchFace {

    private var _awake as Boolean = true;

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
    }

    function onShow() as Void {
    }

    function onHide() as Void {
    }

    function onExitSleep() as Void {
        _awake = true;
    }

    function onEnterSleep() as Void {
        _awake = false;
    }

    function onUpdate(dc as Dc) as Void {
        drawFace(dc, true);
    }

    function onPartialUpdate(dc as Dc) as Void {
        // Keep low-power mode static for the first release. A future version can
        // add clipped second-hand updates per device after simulator profiling.
    }

    private function drawFace(dc as Dc, fullRedraw as Boolean) as Void {
        var w = dc.getWidth();
        var h = dc.getHeight();
        var cx = w / 2;
        var cy = h / 2;
        var radius = minNumber(w, h) / 2;
        var unlocked = isUnlocked();
        var accent = getAccentColor(unlocked);
        var detailLevel = unlocked ? getNumber("SkeletonDetailLevel", 2) : 0;

        if (fullRedraw) {
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
            dc.clear();
            drawSkeletonDial(dc, cx, cy, radius, accent, detailLevel, unlocked);
            drawTicks(dc, cx, cy, radius, accent);
            drawOptionalInfo(dc, cx, cy, radius, accent, unlocked);
        }

        drawHands(dc, cx, cy, radius, accent, unlocked);
    }

    private function drawSkeletonDial(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, detailLevel as Number, unlocked as Boolean) as Void {
        var outer = radius - scale(radius, 9);
        var mid = radius - scale(radius, 29);
        var inner = radius - scale(radius, 67);

        dc.setPenWidth(scale(radius, 3));
        dc.setColor(0xC8CED6, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, outer);

        dc.setPenWidth(scale(radius, 1));
        dc.setColor(0x313946, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, mid);
        dc.drawCircle(cx, cy, inner);

        dc.setPenWidth(scale(radius, 4));
        dc.setColor(0x414956, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, 315.0, scale(radius, 38), scale(radius, 104));
        drawRadialLine(dc, cx, cy, 45.0, scale(radius, 38), scale(radius, 104));
        drawRadialLine(dc, cx, cy, 135.0, scale(radius, 44), scale(radius, 95));
        drawRadialLine(dc, cx, cy, 225.0, scale(radius, 44), scale(radius, 95));

        drawGear(dc, cx - scale(radius, 43), cy - scale(radius, 18), scale(radius, 26), 10, 0x65707F);
        drawGear(dc, cx + scale(radius, 45), cy + scale(radius, 18), scale(radius, 22), 9, 0x535D6A);
        drawOpenHeart(dc, cx, cy + scale(radius, 58), scale(radius, 36), accent, detailLevel);

        if (detailLevel > 0) {
            drawGear(dc, cx + scale(radius, 34), cy - scale(radius, 53), scale(radius, 17), 8, 0x4E5968);
            drawGear(dc, cx - scale(radius, 34), cy + scale(radius, 49), scale(radius, 15), 8, 0x4B5562);
        }

        if (detailLevel > 1) {
            drawJewels(dc, cx, cy, radius, accent);
        }

        if (!unlocked) {
            dc.setColor(0x7E8794, Graphics.COLOR_TRANSPARENT);
            dc.drawText(cx, cy + scale(radius, 91), Graphics.FONT_XTINY, "BASE", Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function drawTicks(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        for (var i = 0; i < 60; i++) {
            var major = (i % 5) == 0;
            var angle = (i * 6).toFloat();
            dc.setPenWidth(major ? scale(radius, 3) : scale(radius, 1));
            dc.setColor(major ? 0xE5E9F0 : 0x667180, Graphics.COLOR_TRANSPARENT);
            drawRadialLine(dc, cx, cy, angle, radius - scale(radius, major ? 24 : 16), radius - scale(radius, 8));
        }

        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - radius + scale(radius, 31), Graphics.FONT_SMALL, "XII", Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx + radius - scale(radius, 31), cy - scale(radius, 10), Graphics.FONT_SMALL, "III", Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx, cy + radius - scale(radius, 46), Graphics.FONT_SMALL, "VI", Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx - radius + scale(radius, 31), cy - scale(radius, 10), Graphics.FONT_SMALL, "IX", Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawHands(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        var clock = System.getClockTime();
        var second = clock.sec;
        var minuteAngle = (clock.min * 6) + (second / 10.0);
        var hourAngle = ((clock.hour % 12) * 30) + (clock.min / 2.0);

        dc.setPenWidth(scale(radius, 9));
        dc.setColor(0xE9EDF3, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, hourAngle, 0, scale(radius, 55));

        dc.setPenWidth(scale(radius, 6));
        dc.setColor(0xF5F7FA, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, minuteAngle, 0, scale(radius, 81));

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.fillCircle(cx, cy, scale(radius, 8));
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(scale(radius, 2));
        dc.drawCircle(cx, cy, scale(radius, 10));

        if (unlocked && getBool("SecondHandEnabled", true) && _awake) {
            dc.setPenWidth(scale(radius, 2));
            dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
            drawRadialLine(dc, cx, cy, (second * 6).toFloat(), -scale(radius, 18), scale(radius, 91));
            dc.setColor(accent, accent);
            dc.fillCircle(cx, cy, scale(radius, 4));
        }
    }

    private function drawOpenHeart(dc as Dc, cx as Number, cy as Number, r as Number, accent as Number, detailLevel as Number) as Void {
        dc.setPenWidth(scale(r, 3));
        dc.setColor(0xB7BEC8, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, r);
        dc.setColor(0x2F3743, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, r - scale(r, 7));

        drawGear(dc, cx, cy, r - scale(r, 13), 12, 0x6B7583);
        dc.setColor(accent, accent);
        dc.fillCircle(cx, cy, scale(r, 5));

        if (detailLevel > 1) {
            dc.setPenWidth(scale(r, 2));
            dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
            drawRadialLine(dc, cx, cy, 90.0, scale(r, 7), r - scale(r, 5));
            drawRadialLine(dc, cx, cy, 270.0, scale(r, 7), r - scale(r, 5));
        }
    }

    private function drawGear(dc as Dc, cx as Number, cy as Number, r as Number, teeth as Number, color as Number) as Void {
        dc.setPenWidth(scale(r, 2));
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, r);
        dc.drawCircle(cx, cy, r / 2);

        for (var i = 0; i < teeth; i++) {
            drawRadialLine(dc, cx, cy, (i * (360 / teeth)).toFloat(), r - scale(r, 4), r + scale(r, 5));
        }
    }

    private function drawJewels(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        dc.setColor(accent, accent);
        fillPointAt(dc, cx, cy, 32.0, scale(radius, 70), scale(radius, 4));
        fillPointAt(dc, cx, cy, 154.0, scale(radius, 62), scale(radius, 3));
        fillPointAt(dc, cx, cy, 248.0, scale(radius, 68), scale(radius, 3));
    }

    private function drawOptionalInfo(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        if (!unlocked) {
            return;
        }

        dc.setColor(0xAEB6C2, Graphics.COLOR_TRANSPARENT);

        if (getBool("ShowDate", false)) {
            var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
            var dateText = Lang.format("$1$/$2$", [today.month, today.day]);
            dc.drawText(cx, cy - scale(radius, 47), Graphics.FONT_XTINY, dateText, Graphics.TEXT_JUSTIFY_CENTER);
        }

        if (getBool("ShowBattery", false)) {
            var stats = System.getSystemStats();
            var batteryText = Lang.format("$1$%", [stats.battery.format("%d")]);
            dc.drawText(cx, cy + scale(radius, 33), Graphics.FONT_XTINY, batteryText, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function drawRadialLine(dc as Dc, cx as Number, cy as Number, degrees as Float, startR as Number, endR as Number) as Void {
        var radians = Math.toRadians((degrees - 90).toFloat());
        var x1 = cx + (Math.cos(radians) * startR);
        var y1 = cy + (Math.sin(radians) * startR);
        var x2 = cx + (Math.cos(radians) * endR);
        var y2 = cy + (Math.sin(radians) * endR);
        dc.drawLine(x1.toNumber(), y1.toNumber(), x2.toNumber(), y2.toNumber());
    }

    private function fillPointAt(dc as Dc, cx as Number, cy as Number, degrees as Float, distance as Number, r as Number) as Void {
        var radians = Math.toRadians((degrees - 90).toFloat());
        var x = cx + (Math.cos(radians) * distance);
        var y = cy + (Math.sin(radians) * distance);
        dc.fillCircle(x.toNumber(), y.toNumber(), r);
    }

    private function isUnlocked() as Boolean {
        var code = getString("UnlockCode", "");
        return code.equals("AUTO-2026") || code.equals("SKELETON-2026") || code.equals("MJVAUTO");
    }

    private function getAccentColor(unlocked as Boolean) as Number {
        if (!unlocked) {
            return 0xC9A45D;
        }
        return getNumber("AccentColor", 0xC9A45D);
    }

    private function getBool(key as String, fallback as Boolean) as Boolean {
        var value = Application.Properties.getValue(key);
        return value == null ? fallback : value as Boolean;
    }

    private function getNumber(key as String, fallback as Number) as Number {
        var value = Application.Properties.getValue(key);
        return value == null ? fallback : value as Number;
    }

    private function getString(key as String, fallback as String) as String {
        var value = Application.Properties.getValue(key);
        return value == null ? fallback : value as String;
    }

    private function scale(base as Number, value as Number) as Number {
        var scaled = ((base * value) / 227).toNumber();
        return scaled < 1 ? 1 : scaled;
    }

    private function minNumber(left as Number, right as Number) as Number {
        return left < right ? left : right;
    }

}
