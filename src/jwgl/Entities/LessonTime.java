package jwgl.Entities;

public class LessonTime {
    private String place;
    private int weekday;
    private int startTime;
    private int endTime;
    private int startWeek;
    private int endWeek;

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        if (place.length() > 0)
            this.place = place;
    }

    public int getWeekday() {
        return weekday;
    }

    public void setWeekday(int weekday) {
        if (weekday >= 1 && weekday <= 7)
            this.weekday = weekday;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        if (startTime >= 1 && startTime <= 11)
            this.startTime = startTime;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setEndTime(int endTime) {
        if (endTime >= 1 && endTime <= 11)
            this.endTime = endTime;
    }

    public int getStartWeek() {
        return startWeek;
    }

    public void setStartWeek(int startWeek) {
        if (startWeek >= 1 && startWeek <= 18)
            this.startWeek = startWeek;
    }

    public int getEndWeek() {
        return endWeek;
    }

    public void setEndWeek(int endWeek) {
        if (startWeek >= 1 && startWeek <= 18)
            this.endWeek = endWeek;
    }
}