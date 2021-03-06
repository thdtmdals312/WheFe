package kr.ac.hansung.whefe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.whefe.model.Coupon;
import kr.ac.hansung.whefe.model.Customer_coupon;
import kr.ac.hansung.whefe.model.Customer_info;

@Repository
public class Customer_couponDao {
	private JdbcTemplate jdbcTemplateObject;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public List<Customer_coupon> getCustomer_coupon(String customer_id) {
		String sql = "select * from customer_coupon where customer_id=? and usable = 1";
		return jdbcTemplateObject.query(sql, new Object[] {customer_id},new RowMapper<Customer_coupon>() {

			@Override
			public Customer_coupon mapRow(ResultSet rs, int rowNum) throws SQLException {

				Customer_coupon customer_coupon = new Customer_coupon();
				customer_coupon.setCafe_id(rs.getString("cafe_id"));
				customer_coupon.setCafe_name(rs.getString("cafe_name"));
				customer_coupon.setCustomer_id(rs.getString("customer_id"));
				customer_coupon.setCoupon_name(rs.getString("coupon_name"));
				customer_coupon.setCoupon_price(rs.getString("coupon_price"));
				customer_coupon.setCoupon_num(rs.getString("coupon_num"));
				customer_coupon.setUsable(rs.getString("usable"));
				customer_coupon.setCoupon_start(rs.getString("coupon_start"));
				customer_coupon.setCoupon_end(rs.getString("coupon_end"));
				
				return customer_coupon;
			}

		});

	}
	
	public List<Customer_coupon> getCustomer_coupon(String cafe_id, String customer_id) {
		String sql = "select * from customer_coupon where cafe_id=? and customer_id=? and usable = ?";
		return jdbcTemplateObject.query(sql, new Object[] {cafe_id,customer_id, 1},new RowMapper<Customer_coupon>() {

			@Override
			public Customer_coupon mapRow(ResultSet rs, int rowNum) throws SQLException {

				Customer_coupon customer_coupon = new Customer_coupon();
				customer_coupon.setCafe_id(rs.getString("cafe_id"));
				customer_coupon.setCustomer_id(rs.getString("customer_id"));
				customer_coupon.setCoupon_name(rs.getString("coupon_name"));
				customer_coupon.setCoupon_num(rs.getString("coupon_num"));
				customer_coupon.setCoupon_price(rs.getString("coupon_price"));
				
				return customer_coupon;
			}

		});

	}
	
	public boolean disableCoupon(String customer_id, String cafe_id, String coupon_name) {
		String sql = "update customer_coupon set usable = 0 where customer_id = ? and cafe_id = ? and coupon_name = ?";
		return jdbcTemplateObject.update(sql, new Object[] {customer_id, cafe_id, coupon_name})==1;
	}
	
	public boolean downloadCoupon(Customer_coupon customer_coupon) {
		String sql = "insert into customer_coupon(customer_id,cafe_id,cafe_name,coupon_name,coupon_price,coupon_start,coupon_end)"
				+ "values(?,?,?,?,?,?,?)";
		String customer_id = customer_coupon.getCustomer_id();
		String cafe_id = customer_coupon.getCafe_id();
		String cafe_name = customer_coupon.getCafe_name();
		String coupon_name = customer_coupon.getCoupon_name();
		String coupon_price = customer_coupon.getCoupon_price();
		String coupon_start = customer_coupon.getCoupon_start();
		String coupon_end = customer_coupon.getCoupon_end();
		return jdbcTemplateObject.update(sql,new Object[] {customer_id,cafe_id,cafe_name,coupon_name,coupon_price,coupon_start,coupon_end})==1;
	}
}
