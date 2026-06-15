import Toybox.ActivityMonitor;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class GarminWatchFaceView extends WatchUi.WatchFace {
    private var _background as BitmapResource;

    function initialize() {
        WatchFace.initialize();
        _background = WatchUi.loadResource(Rez.Drawables.BackgroundGradient) as BitmapResource;
    }

    function onLayout(dc as Dc) as Void {
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Dc) as Void {
        dc.drawBitmap(0, 0, _background);
        drawRadar(dc);
        drawDate(dc);
        drawTime(dc);
        drawSteps(dc);
    }

    function onPartialUpdate(dc as Dc) as Void {
        dc.setClip(0, 88, dc.getWidth(), 104);
        dc.drawBitmap(0, 0, _background);
        drawRadar(dc);
        drawTime(dc);
        dc.clearClip();
    }

    private function drawRadar(dc as Dc) as Void {
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;

        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(centerX, centerY, 42);
        dc.drawCircle(centerX, centerY, 78);
        dc.drawCircle(centerX, centerY, 112);
        dc.drawLine(centerX, 26, centerX, dc.getHeight() - 26);
        dc.drawLine(26, centerY, dc.getWidth() - 26, centerY);

        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(62, 62, dc.getWidth() - 62, dc.getHeight() - 62);
        dc.drawLine(dc.getWidth() - 62, 62, 62, dc.getHeight() - 62);

        dc.setColor(Graphics.COLOR_DK_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(centerX, centerY, centerX + 75, centerY - 75);
        dc.drawLine(centerX + 8, centerY, centerX + 83, centerY - 75);

        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(centerX, centerY, centerX + 96, centerY - 96);
    }

    private function drawDate(dc as Dc) as Void {
        var dateInfo = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format(
            "$1$ $2$ $3$",
            [dateInfo.day_of_week, dateInfo.month, dateInfo.day]
        );

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            30,
            Graphics.FONT_TINY,
            dateString,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    private function drawTime(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var hourMinuteString = Lang.format(
            "$1$:$2$",
            [clockTime.hour.format("%02d"), clockTime.min.format("%02d")]
        );
        var secondString = clockTime.sec.format("%02d");
        var hourMinuteFont = Graphics.FONT_NUMBER_HOT;
        var secondFont = Graphics.FONT_SMALL;
        var hourMinuteWidth = dc.getTextWidthInPixels(hourMinuteString, hourMinuteFont);
        var secondWidth = dc.getTextWidthInPixels(secondString, secondFont);
        var hourMinuteDimensions = dc.getTextDimensions(hourMinuteString, hourMinuteFont);
        var x = (dc.getWidth() - hourMinuteWidth - secondWidth) / 2;
        var y = dc.getHeight() / 2;
        var secondY = y - (hourMinuteDimensions[1] / 2);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            x,
            y,
            hourMinuteFont,
            hourMinuteString,
            Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            x + hourMinuteWidth,
            secondY,
            secondFont,
            secondString,
            Graphics.TEXT_JUSTIFY_LEFT
        );
    }

    private function drawSteps(dc as Dc) as Void {
        var activityInfo = ActivityMonitor.getInfo();
        var stepsString = "-- steps";

        if (activityInfo != null && activityInfo has :steps && activityInfo.steps != null) {
            stepsString = activityInfo.steps.toString() + " steps";
        }

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 48,
            Graphics.FONT_TINY,
            stepsString,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    function onHide() as Void {
    }

    function onExitSleep() as Void {
    }

    function onEnterSleep() as Void {
    }

}
