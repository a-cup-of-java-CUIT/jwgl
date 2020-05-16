package jwgl.service;

import jwgl.DAO.TheDAO;
import jwgl.bean.Student;

/**
 * Authentic
 */
public class Authentic {

    public static boolean login(Student student) {
        String classID = TheDAO.login(student.getStuID(), student.getPassword());

        if (classID == null)
            return false;
        else {
            student.setClassID(classID);
            return true;
        }
    }
}