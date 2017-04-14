package kr.ac.hansung.whefe.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Coupon {
	private String coupon_name;
	private String cafe_id;
	private int coupon_num;
	private int coupon_price;
	private Date coupon_start;
	private Date coupon_end;
	private boolean use_ox;

	public Coupon() {

	}
}