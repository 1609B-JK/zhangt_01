package com.jk.controller.book;

import com.google.gson.Gson;
import com.jk.pojo.book.Book;
import com.jk.service.book.BookService;
import common.util.JsonOutUtil;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * Created by lenovo on 2017/5/15.
 */
@Controller
public class BookController {

    @Autowired
    private BookService bookService;



    @RequestMapping("insertBook")
    public void insertBook(Book book, HttpServletResponse response) {
        bookService.insertBook(book);
        JsonOutUtil.jsonOut("{}", response);
    }

    @RequestMapping("toAddBookPage")
    public String toAddBookPage(){
        return "book/add_book";
    }

    @RequestMapping("selectBookList")
    public void selectBookList(Book book,HttpServletResponse response) {
        List<Book> bookList = bookService.selectBookList(book);
        String json = new Gson().toJson(bookList);
        JsonOutUtil.jsonOut(json, response);
    }

    @RequestMapping("deleteBook")
    public void deleteBook(Book book,HttpServletResponse response){
        bookService.deleteBook(book);
        JsonOutUtil.jsonOut("{}", response);
    }


    @RequestMapping("toEditBookPage")
    public String toEditBookPage(Book book, Model model) {
        Book b = bookService.selectBookByID(book);
        model.addAttribute("book", b);
        return "book/update_book";
    }

    @RequestMapping("updateBookByID")
    public void updateBookByID(Book book, HttpServletResponse response) {
        bookService.updateBookByID(book);
        JsonOutUtil.jsonOut("{}", response);
    }


}
