package jwgl.DAO;

import java.util.ArrayList;

import jwgl.Entities.Score;
import jwgl.Entities.Timetable;

public class TheDAO {
    public static String login(String stuID, String password) {
        String classID = null;
        return classID;
    }

    public static ArrayList<Timetable> queryTimetableStudent(String stuID, String term) {
        ArrayList<Timetable> timetables = null;
        return timetables;
    }

    public static ArrayList<Timetable> queTimetableClass(String classID, String term) {
        ArrayList<Timetable> timetables = null;
        return timetables;
    }

    public static ArrayList<Score> queryScore(String stuID, String term) {
        ArrayList<Score> scores = null;
        return scores;
    }
}