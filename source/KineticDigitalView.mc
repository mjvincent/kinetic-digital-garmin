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

        drawOuterProgress(dc, cx, cy, radius, accent, unlocked);
        drawDateHeader(dc, cx, cy, radius, accent);
        drawTime(dc, cx, cy, radius);
        drawStats(dc, cx, cy, radius, accent, unlocked);
    }

    private function drawOuterProgress(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        var ring = radius - scale(radius, 2);
        var progressAngle = (getRingProgress(unlocked) * 360.0).toNumber();

        dc.setColor(0x101722, 0x101722);
        dc.fillCircle(cx, cy, radius - scale(radius, 18));

        dc.setPenWidth(scale(radius, 5));
        dc.setColor(0x263241, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(cx, cy, ring, Graphics.ARC_COUNTER_CLOCKWISE, 0, 360);
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(cx, cy, ring, Graphics.ARC_COUNTER_CLOCKWISE, 270, 270 + progressAngle);

        dc.setPenWidth(scale(radius, 2));
        dc.setColor(0x526173, Graphics.COLOR_TRANSPARENT);
        for (var i = 0; i < 60; i += 5) {
            drawRadialLine(dc, cx, cy, (i * 6).toFloat(), radius - scale(radius, 21), radius - scale(radius, 13));
        }
    }

    private function drawDateHeader(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number) as Void {
        var medium = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var shortInfo = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dateText = Lang.format("$1$  $2$ $3$", [dayName(shortInfo.day_of_week), medium.month, medium.day.format("%02d")]);

        dc.setColor(0xAAB4C2, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - scale(radius, 139), Graphics.FONT_SMALL, dateText, Graphics.TEXT_JUSTIFY_CENTER);

        dc.setPenWidth(scale(radius, 2));
        dc.setColor(accent, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(cx - scale(radius, 80), cy - scale(radius, 84), cx + scale(radius, 80), cy - scale(radius, 84));
    }

    private function drawTime(dc as Dc, cx as Number, cy as Number, radius as Number) as Void {
        var clock = System.getClockTime();
        var hours = clock.hour;
        var minutes = clock.min;
        var useMilitary = getBool("UseMilitaryFormat", false);

        if (!useMilitary && !System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            } else if (hours == 0) {
                hours = 12;
            }
        }

        var timeString = Lang.format("$1$:$2$", [hours.format("%02d"), minutes.format("%02d")]);
        dc.setColor(0xF4F7FB, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy - scale(radius, 62), Graphics.FONT_NUMBER_HOT, timeString, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawStats(dc as Dc, cx as Number, cy as Number, radius as Number, accent as Number, unlocked as Boolean) as Void {
        var stats = System.getSystemStats();
        var battery = stats.battery.format("%d") + "%";
        var clock = System.getClockTime();
        var activeMinutes = getActiveMinutesText();

        var statsY = cy + scale(radius, 108);
        drawStat(dc, cx - scale(radius, 92), statsY, radius, "BAT", battery, accent);
        drawStat(dc, cx, statsY, radius, "ACT", activeMinutes, 0x81B3D7);

        if (unlocked) {
            var proStat = getNumber("ProStat", 0);
            drawStat(dc, cx + scale(radius, 92), statsY, radius, getProStatLabel(proStat), getProStatValue(proStat), accent);
        } else {
            drawStat(dc, cx + scale(radius, 92), statsY, radius, "PRO", "--", 0x687586);
        }

        var steps = getStepsText();
        dc.setColor(0xB4BECA, Graphics.COLOR_TRANSPARENT);
        dc.drawText(cx, cy + scale(radius, 159), Graphics.FONT_XTINY, steps, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawStat(dc as Dc, x as Number, y as Number, radius as Number, label as String, value as String, color as Number) as Void {
        var halfW = scale(radius, 18);
        var halfH = scale(radius, 24);

        dc.setColor(0x0C121A, 0x0C121A);
        dc.fillRectangle(x - halfW, y - halfH, halfW * 2, halfH * 2);
        dc.fillCircle(x - halfW, y, halfH);
        dc.fillCircle(x + halfW, y, halfH);
        dc.setPenWidth(scale(radius, 2));
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(x - scale(radius, 14), y - scale(radius, 17), x + scale(radius, 14), y - scale(radius, 17));
        dc.setColor(0xF4F7FB, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y - scale(radius, 13), Graphics.FONT_XTINY, value, Graphics.TEXT_JUSTIFY_CENTER);
        dc.setColor(0x7E8998, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y + scale(radius, 11), Graphics.FONT_XTINY, label, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function getStepsText() as String {
        var info = ActivityMonitor.getInfo();
        if (info != null && info.steps != null) {
            return "STEPS " + formatCompact(info.steps);
        }
        return "STEPS --";
    }

    private function getActiveMinutesText() as String {
        var activeMinutes = getActiveMinutes();
        if (activeMinutes != null) {
            return activeMinutes.format("%d") + "m";
        }
        return "--";
    }

    private function getActiveMinutes() as Number? {
        var info = ActivityMonitor.getInfo();
        if (info != null && info.activeMinutesDay != null) {
            var minutes = info.activeMinutesDay;
            return minutes.moderate + minutes.vigorous;
        }
        return null;
    }

    private function getProStatLabel(mode as Number) as String {
        switch (mode) {
            case 1:
                return "STP";
            case 2:
                return "ACT";
            case 3:
                return "CAL";
            case 4:
                return "FLR";
            case 5:
                return "BAT";
        }
        return "SEC";
    }

    private function getProStatValue(mode as Number) as String {
        var info = ActivityMonitor.getInfo();
        var stats = System.getSystemStats();
        var clock = System.getClockTime();

        switch (mode) {
            case 1:
                return (info != null && info.steps != null) ? formatCompact(info.steps) : "--";
            case 2:
                return getActiveMinutesText();
            case 3:
                return (info != null && info.calories != null) ? formatCompact(info.calories) : "--";
            case 4:
                return (info != null && info.floorsClimbed != null) ? info.floorsClimbed.format("%d") : "--";
            case 5:
                return stats.battery.format("%d") + "%";
        }
        return clock.sec.format("%02d");
    }

    private function getRingProgress(unlocked as Boolean) as Float {
        if (!unlocked) {
            return getBatteryProgress();
        }

        switch (getNumber("RingMode", 0)) {
            case 1:
                return getStepsProgress();
            case 2:
                return getActiveMinutesProgress();
            case 3:
                return getDayProgress();
        }
        return getBatteryProgress();
    }

    private function getBatteryProgress() as Float {
        return clampProgress(System.getSystemStats().battery / 100.0);
    }

    private function getStepsProgress() as Float {
        var info = ActivityMonitor.getInfo();
        if (info != null && info.steps != null && info.stepGoal != null && info.stepGoal > 0) {
            return clampProgress(info.steps / info.stepGoal.toFloat());
        }
        return 0.0;
    }

    private function getActiveMinutesProgress() as Float {
        var activeMinutes = getActiveMinutes();
        if (activeMinutes != null) {
            return clampProgress(activeMinutes / 60.0);
        }
        return 0.0;
    }

    private function getDayProgress() as Float {
        var clock = System.getClockTime();
        return clampProgress(((clock.hour * 60) + clock.min) / 1440.0);
    }

    private function clampProgress(value as Float) as Float {
        if (value < 0.0) {
            return 0.0;
        }
        if (value > 1.0) {
            return 1.0;
        }
        return value;
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
        var normalizedCode = normalizeUnlockCode(code);

        if (normalizedCode.equals(normalizeUnlockCode("KINETIC-2026")) || normalizedCode.equals(normalizeUnlockCode("PRO-2026")) || normalizedCode.equals(normalizeUnlockCode("MJVDIGITAL"))) {
            return true;
        }

        var email = normalizeEmail(getString("UnlockEmail", ""));
        if (email.length() == 0) {
            return false;
        }

        return normalizedCode.equals(normalizeUnlockCode(generateUnlockCode(email)));
    }

    private function generateUnlockCode(email as String) as String {
        var bytes = (email + "|KINETIC-DIGITAL-PRO-2026").toUtf8Array();
        var primary = 0x4B44;

        for (var i = 0; i < bytes.size(); i++) {
            primary = ((primary * 33) + bytes[i]) % 65536;
        }

        var secondary = ((primary ^ ((email.length() * 257) % 65536)) + 0x2026) % 65536;
        return "KD-" + primary.format("%04X") + "-" + secondary.format("%04X");
    }

    private function normalizeEmail(email as String) as String {
        var bytes = email.toLower().toUtf8Array();
        var normalized = "";

        for (var i = 0; i < bytes.size(); i++) {
            if (bytes[i] != 32) {
                normalized += bytes[i].toChar().toString();
            }
        }

        return normalized;
    }

    private function normalizeUnlockCode(code as String) as String {
        var bytes = code.toLower().toUtf8Array();
        var normalized = "";

        for (var i = 0; i < bytes.size(); i++) {
            if (bytes[i] != 32 && bytes[i] != 45) {
                normalized += bytes[i].toChar().toString();
            }
        }

        return normalized;
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
