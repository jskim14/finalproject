package com.nb.spring.common;

public enum ProductType {
	SELLING(0),
	SUCCESS(1),
	SHIPPING(2),
	ARRIVAL(3),
	DONE(4),
	FAILURE(5)
	;
	
	private final int value;
	
	ProductType(int value){ this.value = value;}
	
	public int getValue() {return value;}

}
