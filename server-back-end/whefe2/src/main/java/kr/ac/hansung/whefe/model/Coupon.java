package kr.ac.hansung.whefe.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Coupon {
	private int coupon_num;
	private String coupon_name;
	private String cafe_id;
	private String coupon_price; // private String coupon_price;
	
	private String coupon_start;
	private String coupon_end;
	private boolean use_ox;

	public Coupon() {

	}
}
