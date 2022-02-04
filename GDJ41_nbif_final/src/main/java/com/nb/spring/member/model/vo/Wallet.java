package com.nb.spring.member.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Wallet {
	private String category;
	private String categoryDetail;
	private Date tradeDate;
	private String amount;
	private String productNo;

}
