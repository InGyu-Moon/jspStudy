package org.example.jspstudy.ajaxboard;


import java.util.Date;

public class AjaxBoardDto {
    private String num;
    private String writer;
    private String subject;
    private String content;
    private String avata;
    private Date writeday;

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAvata() {
        return avata;
    }

    public void setAvata(String avata) {
        this.avata = avata;
    }

    public Date getWriteday() {
        return writeday;
    }

    public void setWriteday(Date writeday) {
        this.writeday = writeday;
    }

    @Override
    public String toString() {
        return "AjaxBoardDto{" +
                "num='" + num + '\'' +
                ", writer='" + writer + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", avata='" + avata + '\'' +
                ", writeday=" + writeday +
                '}';
    }
}
