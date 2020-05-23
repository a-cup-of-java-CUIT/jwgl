package jwgl.service;

import java.util.ArrayList;

import jwgl.DAO.TheDAO;
import jwgl.Entities.Score;
import jwgl.Entities.Timetable;
import jwgl.bean.Student;

public class serve {
    public static ArrayList<Timetable> getTimetable(tableTypeEnum tableType, int term, Student student) {
        ArrayList<Timetable> timetables;

        switch (tableType) {
            case STUDENT_TABLE:
                timetables = TheDAO.queryTimetableStudent(student.getStuID(), term);
                break;

            case CLASS_TABLE:
                timetables = TheDAO.queryTimetableClass(student.getClassID(), term);
                break;

            default:
                timetables = null;
                break;
        }

        return timetables;
    }

    public static ArrayList<Score> getScore(Student student, int term) {
        return TheDAO.queryScore(student.getStuID(), term);
    }
}