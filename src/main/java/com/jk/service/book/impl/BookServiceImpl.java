package com.jk.service.book.impl;

import com.jk.dao.book.BookDao;
import com.jk.pojo.book.Book;
import com.jk.service.book.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lenovo on 2017/5/15.
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    public void insertBook(Book book) {
        bookDao.insertBook(book);
    }

    public List<Book> selectBookList(Book book) {
        return bookDao.selectBookList(book);
    }

    public void deleteBook(Book book) {
        bookDao.deleteBook(book);
    }

    public Book selectBookByID(Book book) {
        return bookDao.selectBookByID(book);
    }

    public void updateBookByID(Book book) {
        bookDao.updateBookByID(book);
    }

    public List<Book> selectBookList() {
        return bookDao.selectBookList();
    }
}
