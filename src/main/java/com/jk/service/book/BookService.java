package com.jk.service.book;

import com.jk.pojo.book.Book;

import java.util.List;

/**
 * Created by lenovo on 2017/5/15.
 */
public interface BookService {
    void insertBook(Book book);
    List<Book> selectBookList();

    List<Book> selectBookList(Book book);

    void deleteBook(Book book);

    Book selectBookByID(Book book);

    void updateBookByID(Book book);
}
