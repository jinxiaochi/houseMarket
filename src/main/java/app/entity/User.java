package app.entity;

/**
 * @author jinxiaochi
 * @date  2020年4月22日
 * @effect User的实体类
 */
public class User {
	private String name;
	private String address;
	private String phoneNum;
	public String getUserName() {
		return name;
	}
	public void setUserName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phoneNum;
	}
	public void setPhone(String phone) {
		this.phoneNum = phone;
	}

	@Override
	public String toString() {
		return "User [userName=" + name +  ", address=" + address
				+ ", phoneNum=" + phoneNum + "]";
	}
	
	
	
	
}
