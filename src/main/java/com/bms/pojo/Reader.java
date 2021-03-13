package com.bms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@NoArgsConstructor
@AllArgsConstructor
public class Reader {

    /*
    *
    * Field          Type          Null    Key     Default  Extra
-------------  ------------  ------  ------  -------  ----------------
r_id           int(11)       NO      PRI     (NULL)   auto_increment
r_card         varchar(20)   NO              (NULL)
r_nick         varchar(50)   NO              (NULL)
r_privilege    int(1)        NO              0
r_sex          int(1)        NO              0
r_photo        varchar(100)  NO              (NULL)
r_regist_time  datetime      YES             (NULL)
    *
    * */
    private Integer rId;
    private String rCard;
    private String rNick;
    private Integer rPrivilege;
    private Integer rSex;
    private String rPhoto;
    private Timestamp rRegistTime;
    private String rPassword;

    public String getrPassword() {
        return rPassword;
    }

    public void setrPassword(String rPassword) {
        this.rPassword = rPassword;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getrCard() {
        return rCard;
    }

    public void setrCard(String rCard) {
        this.rCard = rCard;
    }

    public String getrNick() {
        return rNick;
    }

    public void setrNick(String rNick) {
        this.rNick = rNick;
    }

    public Integer getrPrivilege() {
        return rPrivilege;
    }

    public void setrPrivilege(Integer rPrivilege) {
        this.rPrivilege = rPrivilege;
    }

    public Integer getrSex() {
        return rSex;
    }

    public void setrSex(Integer rSex) {
        this.rSex = rSex;
    }

    public String getrPhoto() {
        return rPhoto;
    }

    public void setrPhoto(String rPhoto) {
        this.rPhoto = rPhoto;
    }

    public Timestamp getrRegistTime() {
        return rRegistTime;
    }

    public void setrRegistTime(Timestamp rRegistTime) {
        this.rRegistTime = rRegistTime;
    }
}
