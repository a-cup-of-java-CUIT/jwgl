package jwgl.Entities;

import java.util.ArrayList;

public class Timetable {
    private String code;
    private String name;
    private float credit;
    private String lessonID;
    private String classID;
    private String teacher;
    private ArrayList<LessonTime> time;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        if (code.length() == 6 && Character.isAlphabetic(code.charAt(0)) && Character.isAlphabetic(code.charAt(1))
                && Character.isDigit(code.charAt(2)) && Character.isDigit(code.charAt(3))
                && Character.isDigit(code.charAt(4)) && Character.isAlphabetic(code.charAt(5)))
            this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name.length() > 0)
            this.name = name;
    }

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        if (credit >= 0.5 && credit <= 4.5 && credit * 2 % 1 == 0)
            this.credit = credit;
    }

    public String getLessonID() {
        return lessonID;
    }

    public void setLessonID(String lessonID) {
        if (lessonID.length() > 13 && lessonID.length() < 16)
            this.lessonID = lessonID;
    }

    public String getClassID() {
        return classID;
    }

    public void setClassID(String classID) {
        if (classID.length() > 0)
            this.classID = classID;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        if (teacher.length() >= 0 && teacher.length() <= 4)
            this.teacher = teacher;
    }

    public ArrayList<LessonTime> getTime() {
        return time;
    }

    public void setTime(ArrayList<LessonTime> time) {
        this.time = time;
    }
}