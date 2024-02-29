package org.example.jspstudy.quiz.model;

import java.sql.Timestamp;

public class QuizDto {
    private String num;
    private String name;
    private String age;
    private String phone;
    private int licence;
    private Timestamp date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getLicence() {
        return licence;
    }

    public void setLicence(int licence) {
        this.licence = licence;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
