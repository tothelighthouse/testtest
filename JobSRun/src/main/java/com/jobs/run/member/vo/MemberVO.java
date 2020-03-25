package com.jobs.run.member.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Entity
@Data
public class MemberVO {
	private String id;
	private String pw;
	private String tel;
	private String nickname;
	private String gender;
	private Date birth;
	private String region;
	private Timestamp cdate;
	private Timestamp udate;
	private long balance;
	private String clientLocation;
	private String shooterLocation;

	// �궗吏� �벑濡�
	private MultipartFile file;
	private byte[] pic;
	private String fname;
	private long fsize;

	// 怨좎븸 異붿쿇 �뿬遺�
	private int moneyrecommend;
}
