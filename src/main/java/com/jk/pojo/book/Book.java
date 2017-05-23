package com.jk.pojo.book;

import java.io.Serializable;

/**
 * Created by lenovo on 2017/5/15.
 */
public class Book implements Serializable {

    private int bookID;

    private String bookName;

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
}
