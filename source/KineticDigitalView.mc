import Toybox.ActivityMonitor;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Math;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class KineticDigitalView extends WatchUi.WatchFace {

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
    }

    function onEnterSleep() as Void {
    }

    function onUpdate(dc as Dc) as Void {
        drawFace(dc);
    }

    function onPartialUpdate(dc as Dc) as Void {
    }

    private function drawFace(dc as Dc) as Void {
        var w = dc.getWidth();
        var h = dc.getHeight();
        var cx = w / 2;
        var cy = h / 2;
        var radius = minNumber(w, h) / 2;
        var unlocked = isUnlocked();
        var accent = getAccentColor(unlocked);

        dc.setColor(0x07090D, 0x07090D);
        dc.clear();

        drawOuterProgress(dc, cx, cy, radius, accent);
        drawSubtleMechanics(dc, cx, cy, radius, accent, unlocked);
        drawDateHeader(dc, cx, cy, radius, accent);
        drawTime(dc, cx, cy, radius);
        drawStats(dc, cx, cy, radius, accent, unlocked);
        drawUnlockHint(dc, cx, cy, radius, unlocked);
    }

    private function drawOuterProgress(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        var ring = radius - scale(radius, 8);
        var stats = System.getSystemStats();
        var battery = stats.battery;
        var batteryAngle = ((battery / 100.0) * 360).toNumber();

        dc.setColor(0x111821, 0x111821);
        dc.fillCircle(cx, cy, radius - scale(radius, 28));

        dc.setPenWidth(scale(radius, 4));
        dc.setColor(0x263241, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(cx, cy, ring, Graphics.ARC_COUNTER_CLOCKWISE, 0, 360);
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(cx, cy, ring, Graphics.ARC_COUNTER_CLOCKWISE, 270, 270 + batteryAngle);

        dc.setPenWidth(scale(radius, 2));
        dc.setColor(0x526173, Graphics.COLOR_TRANSPARENT);
        for (var i = 0; i < 60; i += 5) {
            drawRadialLine(dc, cx, cy, (i * 6).toFloat(), radius - scale(radius, 26), radius - scale(radius, 18));
        }
    }

    private function drawSubtleMechanics(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        dc.setPenWidth(scale(radius, 1));
        dc.setColor(0x263444, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(cx - scale(radius, 118), cy - scale(radius, 3), cx + scale(radius, 118), cy - scale(radius, 3));
        dc.drawLine(cx - scale(radius, 84), cy + scale(radius, 75), cx + scale(radius, 84), cy + scale(radius, 75));
        dc.drawCircle(cx - scale(radius, 106), cy - scale(radius, 3), scale(radius, 4));
        dc.drawCircle(cx + scale(radius, 106), cy - scale(radius, 3), scale(radius, 4));

        dc.setPenWidth(scale(radius, 3));
        dc.setColor(0x3A4553, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(cx + scale(radius, 54), cy - scale(radius, 84), cx + scale(radius, 104), cy - scale(radius, 70));
        dc.drawLine(cx + scale(radius, 49), cy - scale(radius, 62), cx + scale(radius, 108), cy - scale(radius, 44));
        dc.drawLine(cx + scale(radius, 44), cy - scale(radius, 40), cx + scale(radius, 99), cy - scale(radius, 24));

        dc.setColor(accent, accent);
        dc.fillCircle(cx + scale(radius, 70), cy - scale(radius, 78), scale(radius, 4));
        dc.fillCircle(cx + scale(radius, 87), cy - scale(radius, 48), scale(radius, 4));

        if (unlocked) {
            dc.setPenWidth(scale(radius, 2));
            dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
            dc.drawCircle(cx + scale(radius, 92), cy + scale(radius, 63), scale(radius, 24));
            dc.drawCircle(cx + scale(radius, 92), cy + scale(radius, 63), scale(radius, 12));
        }
    }

    private function drawDateHeader(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        var medium = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var shortInfo = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dateText = Lang.format("$1$  $2$ $3$", [dayName(shortInfo.day_of_week), medium.month, medium.day.format("%02d")]);

        dc.setColor(0xAAB4C2, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - scale(radius, 124), Graphics.FONT_SMALL, dateText, Graphics.TEXT_JUSTIFY_CENTER);

        dc.setPenWidth(scale(radius, 2));
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(cx - scale(radius, 48), cy - scale(radius, 96), cx + scale(radius, 48), cy - scale(radius, 96));
    }

    private function drawTime(dc as Dc, cx as Number, cy as Number, radius as Number) as Void {
        var clock = System.getClockTime();
        var hours = clock.hour;
        var timeFormat = "$1$:$2$";

        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            } else if (hours == 0) {
                hours = 12;
            }
        } else if (getBool("UseMilitaryFormat", false)) {
            timeFormat = "$1$$2$";
        }

        var timeString = Lang.format(timeFormat, [hours.format("%02d"), clock.min.format("%02d")]);
        dc.setColor(0xF4F7FB, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - scale(radius, 61), Graphics.FONT_NUMBER_HOT, timeString, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawStats(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        var stats = System.getSystemStats();
        var battery = stats.battery.format("%d") + "%";
        var clock = System.getClockTime();
        var dayPct = ((((clock.hour * 60) + clock.min) / 1440.0) * 100).toNumber().format("%d") + "%";

        drawStat(dc, cx - scale(radius, 76), cy + scale(radius, 75), "BAT", battery, accent);
        drawStat(dc, cx, cy + scale(radius, 75), "DAY", dayPct, 0x81B3D7);

        if (unlocked) {
            drawStat(dc, cx + scale(radius, 76), cy + scale(radius, 75), "SEC", clock.sec.format("%02d"), accent);
        } else {
            drawStat(dc, cx + scale(radius, 76), cy + scale(radius, 75), "PRO", "--", 0x687586);
        }

        var steps = getStepsText();
        dc.setColor(0xB4BECA, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy + scale(radius, 121), Graphics.FONT_XTINY, steps, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawStat(dc as Dc, x as Number, y as Number, label as String, value as String, color as Number) as Void {
        dc.setColor(0x101720, 0x101720);
        dc.fillCircle(x, y, 31);
        dc.setPenWidth(2);
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(x, y, 31);
        dc.setColor(0xF4F7FB, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y - 22, Graphics.FONT_XTINY, value, Graphics.TEXT_JUSTIFY_CENTER);
        dc.setColor(0x7E8998, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y - 2, Graphics.FONT_XTINY, label, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawUnlockHint(dc as Dc, cx as Number, cy as Number, radius as Number, unlocked as Boolean) as Void {
        if (unlocked) {
            return;
        }

        dc.setColor(0x667284, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy + scale(radius, 151), Graphics.FONT_XTINY, "UNLOCK FOR SECONDS + COLORS", Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function getStepsText() as String {
        var info = ActivityMonitor.getInfo();
        if (info != null && info.steps != null) {
            return "STEPS " + formatCompact(info.steps);
        }
        return "STEPS --";
    }

    private function formatCompact(value as Number) as String {
        if (value >= 1000) {
            return (value / 1000.0).format("%.1f") + "K";
        }
        return value.format("%d");
    }

    private function drawRadialLine(dc as Dc, cx as Number, cy as Number, degrees as Float, startR as Number, endR as Number) as Void {
        var radians = Math.toRadians((degrees - 90).toFloat());
        var x1 = cx + (Math.cos(radians) * startR);
        var y1 = cy + (Math.sin(radians) * startR);
        var x2 = cx + (Math.cos(radians) * endR);
        var y2 = cy + (Math.sin(radians) * endR);
        dc.drawLine(x1.toNumber(), y1.toNumber(), x2.toNumber(), y2.toNumber());
    }

    private function dayName(dayOfWeek as Number) as String {
        switch (dayOfWeek) {
            case Time.Gregorian.DAY_MONDAY:
                return "MON";
            case Time.Gregorian.DAY_TUESDAY:
                return "TUE";
            case Time.Gregorian.DAY_WEDNESDAY:
                return "WED";
            case Time.Gregorian.DAY_THURSDAY:
                return "THU";
            case Time.Gregorian.DAY_FRIDAY:
                return "FRI";
            case Time.Gregorian.DAY_SATURDAY:
                return "SAT";
            case Time.Gregorian.DAY_SUNDAY:
                return "SUN";
        }
        return "---";
    }

    private function isUnlocked() as Boolean {
        var code = getString("UnlockCode", "");
        return code.equals("KINETIC-2026") || code.equals("PRO-2026") || code.equals("MJVDIGITAL");
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
