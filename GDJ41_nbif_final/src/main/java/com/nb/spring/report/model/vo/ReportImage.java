package com.nb.spring.report.model.vo;

import com.nb.spring.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportImage {
	private Product productNo;
	private String fileName;
}