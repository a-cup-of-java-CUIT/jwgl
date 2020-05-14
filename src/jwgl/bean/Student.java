package jwgl.bean;

public class Student {
    private String stuID;
    private String password;
    private boolean login;
    private String classID;

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        if (stuID.length() == 10)
            this.stuID = stuID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password.length() > 5)
            this.password = password;
    }

    public boolean isLogin() {
        return login;
    }

    public void setLogin(boolean login) {
        this.login = login;
    }

    public String getClassID() {
        return classID;
    }

    public void setClassID(String classID) {
        if (classID.length() > 0)
            this.classID = classID;
    }
}