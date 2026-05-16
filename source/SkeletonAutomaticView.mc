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
        var outer = radius - scale(radius, 7);
        var chapter = radius - scale(radius, 31);
        var movement = radius - scale(radius, 54);

        dc.setColor(0x090B0E, 0x090B0E);
        dc.fillCircle(cx, cy, outer);
        dc.setColor(0x171B20, 0x171B20);
        dc.fillCircle(cx, cy, chapter);
        dc.setColor(0x242A31, 0x242A31);
        dc.fillCircle(cx, cy, movement);

        dc.setPenWidth(scale(radius, 5));
        dc.setColor(0x343A42, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, outer);
        dc.setPenWidth(scale(radius, 2));
        dc.setColor(0x08090B, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, chapter + scale(radius, 9));
        dc.drawCircle(cx, cy, chapter);

        drawMovementPlate(dc, cx, cy, radius, accent, detailLevel);
        drawSubDial(dc, cx, cy - scale(radius, 70), scale(radius, 34), accent, "90", "10");
        drawSubDial(dc, cx + scale(radius, 30), cy + scale(radius, 63), scale(radius, 32), accent, "65", "85");
        drawDateDisc(dc, cx - scale(radius, 74), cy + scale(radius, 64), scale(radius, 29), unlocked);

        dc.setPenWidth(scale(radius, 5));
        dc.setColor(0x0E1116, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, 300.0, scale(radius, 20), scale(radius, 105));
        drawRadialLine(dc, cx, cy, 64.0, scale(radius, 32), scale(radius, 98));

        drawGear(dc, cx + scale(radius, 58), cy - scale(radius, 43), scale(radius, 22), 12, 0x6C747F);
        drawGear(dc, cx + scale(radius, 64), cy + scale(radius, 25), scale(radius, 26), 13, 0x626B77);
        drawOpenHeart(dc, cx + scale(radius, 67), cy + scale(radius, 64), scale(radius, 31), accent, detailLevel);

        if (detailLevel > 0) {
            drawRightBridgework(dc, cx, cy, radius, accent);
            drawGear(dc, cx - scale(radius, 58), cy - scale(radius, 30), scale(radius, 19), 10, 0x4F5966);
        }

        if (detailLevel > 1) {
            drawJewels(dc, cx, cy, radius, accent);
        }

        drawStatusBadge(dc, cx - scale(radius, 73), cy - scale(radius, 50), scale(radius, 18), unlocked);

        if (!unlocked) {
            dc.setColor(0x7E8794, Graphics.COLOR_TRANSPARENT);
            dc.drawText(cx, cy + scale(radius, 100), Graphics.FONT_XTINY, "BASE", Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function drawTicks(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        for (var i = 0; i < 60; i++) {
            var major = (i % 5) == 0;
            var angle = (i * 6).toFloat();
            dc.setPenWidth(major ? scale(radius, 5) : scale(radius, 2));
            dc.setColor(major ? 0xECEFF3 : 0x5F6874, Graphics.COLOR_TRANSPARENT);
            drawRadialLine(dc, cx, cy, angle, radius - scale(radius, major ? 32 : 21), radius - scale(radius, 15));
        }

        dc.setPenWidth(scale(radius, 3));
        dc.setColor(0x2B3038, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, 0.0, radius - scale(radius, 34), radius - scale(radius, 9));
        drawRadialLine(dc, cx, cy, 180.0, radius - scale(radius, 34), radius - scale(radius, 9));
    }

    private function drawHands(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        var clock = System.getClockTime();
        var second = clock.sec;
        var minuteAngle = (clock.min * 6) + (second / 10.0);
        var hourAngle = ((clock.hour % 12) * 30) + (clock.min / 2.0);

        dc.setPenWidth(scale(radius, 13));
        dc.setColor(0x050607, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, hourAngle, -scale(radius, 8), scale(radius, 57));
        dc.setPenWidth(scale(radius, 8));
        dc.setColor(0xE9EDF3, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, hourAngle, 0, scale(radius, 55));
        dc.setPenWidth(scale(radius, 2));
        dc.setColor(0x050607, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, hourAngle, scale(radius, 8), scale(radius, 49));

        dc.setPenWidth(scale(radius, 11));
        dc.setColor(0x050607, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, minuteAngle, -scale(radius, 12), scale(radius, 88));
        dc.setPenWidth(scale(radius, 6));
        dc.setColor(0xF5F7FA, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, minuteAngle, 0, scale(radius, 81));
        dc.setPenWidth(scale(radius, 2));
        dc.setColor(0x050607, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, minuteAngle, scale(radius, 12), scale(radius, 75));

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.fillCircle(cx, cy, scale(radius, 11));
        dc.setColor(0xD9DEE6, 0xD9DEE6);
        dc.fillCircle(cx, cy, scale(radius, 7));
        dc.setColor(0x69717C, Graphics.COLOR_TRANSPARENT);
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

    private function drawMovementPlate(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, detailLevel as Number) as Void {
        dc.setPenWidth(scale(radius, 3));
        dc.setColor(0x373E48, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, 248.0, scale(radius, 28), scale(radius, 105));
        drawRadialLine(dc, cx, cy, 288.0, scale(radius, 30), scale(radius, 104));
        drawRadialLine(dc, cx, cy, 112.0, scale(radius, 35), scale(radius, 103));
        drawRadialLine(dc, cx, cy, 72.0, scale(radius, 34), scale(radius, 104));

        dc.setPenWidth(scale(radius, 7));
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, 63.0, scale(radius, 60), scale(radius, 90));
        drawRadialLine(dc, cx, cy, 116.0, scale(radius, 55), scale(radius, 84));

        dc.setPenWidth(scale(radius, 2));
        dc.setColor(0x15191F, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx - scale(radius, 58), cy - scale(radius, 7), scale(radius, 40));
        dc.drawCircle(cx + scale(radius, 56), cy - scale(radius, 4), scale(radius, 43));
    }

    private function drawSubDial(dc as Dc, cx as Number, cy as Number, r as Number, accent as Number, leftLabel as String, rightLabel as String) as Void {
        dc.setColor(0x20252C, 0x20252C);
        dc.fillCircle(cx, cy, r);
        dc.setPenWidth(scale(r, 2));
        dc.setColor(0x434B57, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, r);
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, r - scale(r, 6));

        dc.setPenWidth(scale(r, 2));
        dc.setColor(0xB8C0CB, Graphics.COLOR_TRANSPARENT);
        drawRadialLine(dc, cx, cy, 205.0, 0, r - scale(r, 9));
        dc.setColor(0xAEB6C2, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx - scale(r, 15), cy - scale(r, 16), Graphics.FONT_XTINY, leftLabel, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx + scale(r, 16), cy - scale(r, 16), Graphics.FONT_XTINY, rightLabel, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx, cy + scale(r, 8), Graphics.FONT_XTINY, "50", Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawDateDisc(dc as Dc, cx as Number, cy as Number, r as Number, unlocked as Boolean) as Void {
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var text = unlocked && getBool("ShowDate", true) ? today.day.format("%d") : "--";

        dc.setColor(0x2B3038, 0x2B3038);
        dc.fillCircle(cx, cy, r);
        dc.setPenWidth(scale(r, 2));
        dc.setColor(0x3E4651, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, r);
        dc.setColor(0xECEFF3, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - scale(r, 16), Graphics.FONT_MEDIUM, text, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawStatusBadge(dc as Dc, cx as Number, cy as Number, r as Number, unlocked as Boolean) as Void {
        dc.setColor(0x303740, 0x303740);
        dc.fillCircle(cx, cy, r);
        dc.setColor(0xC8CED7, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - scale(r, 10), Graphics.FONT_XTINY, unlocked ? "BT" : "LK", Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawRightBridgework(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        var bx = cx + scale(radius, 50);
        var by = cy - scale(radius, 6);

        dc.setPenWidth(scale(radius, 8));
        dc.setColor(0x11151B, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(bx - scale(radius, 8), by - scale(radius, 45), bx + scale(radius, 58), by - scale(radius, 55));
        dc.drawLine(bx - scale(radius, 20), by - scale(radius, 10), bx + scale(radius, 57), by - scale(radius, 21));
        dc.drawLine(bx - scale(radius, 28), by + scale(radius, 24), bx + scale(radius, 46), by + scale(radius, 7));
        dc.drawLine(bx - scale(radius, 17), by + scale(radius, 54), bx + scale(radius, 32), by + scale(radius, 30));

        dc.setPenWidth(scale(radius, 4));
        dc.setColor(0x707884, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(bx - scale(radius, 8), by - scale(radius, 45), bx + scale(radius, 58), by - scale(radius, 55));
        dc.drawLine(bx - scale(radius, 20), by - scale(radius, 10), bx + scale(radius, 57), by - scale(radius, 21));
        dc.drawLine(bx - scale(radius, 28), by + scale(radius, 24), bx + scale(radius, 46), by + scale(radius, 7));
        dc.drawLine(bx - scale(radius, 17), by + scale(radius, 54), bx + scale(radius, 32), by + scale(radius, 30));

        dc.setColor(accent, accent);
        dc.fillCircle(bx + scale(radius, 12), by - scale(radius, 38), scale(radius, 5));
        dc.fillCircle(bx - scale(radius, 8), by + scale(radius, 14), scale(radius, 5));
        dc.fillCircle(bx + scale(radius, 23), by + scale(radius, 39), scale(radius, 4));
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
