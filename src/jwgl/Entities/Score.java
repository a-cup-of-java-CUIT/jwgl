package jwgl.Entities;

public class Score {
    private String code;
    private String lessonID;
    private String name;
    private String type;
    private float credit;
    private int regular;
    private int finalExam;
    private int total;
    private float GP;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        if (code.length() == 6 && Character.isAlphabetic(code.charAt(0)) && Character.isAlphabetic(code.charAt(1))
                && Character.isDigit(code.charAt(2)) && Character.isDigit(code.charAt(3))
                && Character.isDigit(code.charAt(4)) && Character.isAlphabetic(code.charAt(5)))
            this.code = code;
    }

    public String getLessonID() {
        return lessonID;
    }

    public void setLessonID(String lessonID) {
        if (lessonID.length() == 13) {
            if (Character.isAlphabetic(lessonID.charAt(0)) && Character.isAlphabetic(lessonID.charAt(1))
                    && Character.isDigit(lessonID.charAt(2)) && Character.isDigit(lessonID.charAt(3))
                    && Character.isDigit(lessonID.charAt(4)) && Character.isAlphabetic(lessonID.charAt(5))
                    && lessonID.charAt(6) == '.' && Character.isDigit(lessonID.charAt(7))
                    && Character.isDigit(lessonID.charAt(8)) && Character.isDigit(lessonID.charAt(9))
                    && Character.isDigit(lessonID.charAt(10)) && Character.isDigit(lessonID.charAt(11))
                    && Character.isDigit(lessonID.charAt(12)))
                this.lessonID = lessonID;
        } else if (lessonID.length() == 16)
            if (Character.isAlphabetic(lessonID.charAt(0)) && Character.isAlphabetic(lessonID.charAt(1))
                    && Character.isDigit(lessonID.charAt(2)) && Character.isDigit(lessonID.charAt(3))
                    && Character.isDigit(lessonID.charAt(4)) && Character.isAlphabetic(lessonID.charAt(5))
                    && lessonID.charAt(6) == '-' && Character.isDigit(lessonID.charAt(7))
                    && Character.isDigit(lessonID.charAt(8)) && lessonID.charAt(9) == '.'
                    && Character.isDigit(lessonID.charAt(10)) && Character.isDigit(lessonID.charAt(11))
                    && Character.isDigit(lessonID.charAt(12)) && Character.isDigit(lessonID.charAt(13))
                    && Character.isDigit(lessonID.charAt(14)) && Character.isDigit(lessonID.charAt(15)))
                this.lessonID = lessonID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name.length() > 0)
            this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        if (type.length() > 0)
            this.type = type;
    }

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        if (credit >= 0.5 && credit <= 4.5 && credit * 2 % 1 == 0)
            this.credit = credit;
    }

    public int getRegular() {
        return regular;
    }

    public void setRegular(int regular) {
        if (regular >= 0 && regular <= 100)
            this.regular = regular;
    }

    public int getFinalExam() {
        return finalExam;
    }

    public void setFinalExam(int finalExam) {
        if (finalExam >= 0 && finalExam <= 100)
        this.finalExam = finalExam;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        if (total >= 0 && total <= 100)
        this.total = total;
    }

    public float getGP() {
        return GP;
    }

    public void setGP(float gP) {
        if (gP >= 0 && gP <= 5)
        GP = gP;
    }
}