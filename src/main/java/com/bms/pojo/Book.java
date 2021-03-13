package com.bms.pojo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;

@Component
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    private Integer id;
    private String ISBN;
    private String bName;
    private Float bPrice;
    private String bAuthor;
    private String bPublisher;
    private Integer bNum;
    private Date bPubTime;
    private Timestamp bJoinTime;
    private String bPath;
    private String bIntroduce;
    private Integer bLendNum;
    private Integer bState;

    public Integer getbState() {
        return bState;
    }

    public void setbState(Integer bState) {
        this.bState = bState;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public Float getbPrice() {
        return bPrice;
    }

    public void setbPrice(Float bPrice) {
        this.bPrice = bPrice;
    }

    public String getbAuthor() {
        return bAuthor;
    }

    public void setbAuthor(String bAuthor) {
        this.bAuthor = bAuthor;
    }

    public String getbPublisher() {
        return bPublisher;
    }

    public void setbPublisher(String bPublisher) {
        this.bPublisher = bPublisher;
    }

    public Integer getbNum() {
        return bNum;
    }

    public void setbNum(Integer bNum) {
        this.bNum = bNum;
    }

    public Date getbPubTime() {
        return bPubTime;
    }

    public void setbPubTime(Date bPubTime) {
        this.bPubTime = bPubTime;
    }

    public Timestamp getbJoinTime() {
        return bJoinTime;
    }

    public void setbJoinTime(Timestamp bJoinTime) {
        this.bJoinTime = bJoinTime;
    }

    public String getbPath() {
        return bPath;
    }

    public void setbPath(String bPath) {
        this.bPath = bPath;
    }

    public String getbIntroduce() {
        return bIntroduce;
    }

    public void setbIntroduce(String bIntroduce) {
        this.bIntroduce = bIntroduce;
    }

    public Integer getbLendNum() {
        return bLendNum;
    }

    public void setbLendNum(Integer bLendNum) {
        this.bLendNum = bLendNum;
    }
}
