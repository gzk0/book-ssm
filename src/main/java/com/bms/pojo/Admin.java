package com.bms.pojo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Component
public class Admin {
    private Integer aId;
    private String aEmail;
    private String aPassword;
    private String aNick;
    private Integer aPrivilege;
    private String aPhoto;
    private Integer aSex;
    private Timestamp aRegistTime;
    private String aCreed;
    private Integer aState;

    public Integer getaState() {
        return aState;
    }

    public void setaState(Integer aState) {
        this.aState = aState;
    }

    public String getaCreed() {
        return aCreed;
    }

    public void setaCreed(String aCreed) {
        this.aCreed = aCreed;
    }

    public Timestamp getaRegistTime() {
        return aRegistTime;
    }

    public void setaRegistTime(Timestamp aRegistTime) {
        this.aRegistTime = aRegistTime;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword;
    }

    public String getaNick() {
        return aNick;
    }

    public void setaNick(String aNick) {
        this.aNick = aNick;
    }

    public Integer getaPrivilege() {
        return aPrivilege;
    }

    public void setaPrivilege(Integer aPrivilege) {
        this.aPrivilege = aPrivilege;
    }

    public String getaPhoto() {
        return aPhoto;
    }

    public void setaPhoto(String aPhoto) {
        this.aPhoto = aPhoto;
    }

    public Integer getaSex() {
        return aSex;
    }

    public void setaSex(Integer aSex) {
        this.aSex = aSex;
    }
}
