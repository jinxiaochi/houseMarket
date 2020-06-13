package app.entity;

/**
 * @author jinxiaochi
 * @date  2020年4月22日
 * @effect House实体类
 */
public class House {
	private int houseId;
	private int userId;
	private float price;
	private int isNew;
	private int type;
	private String location;
	private String imgUrls;
	private int hot;
	private float area;
	private String recommend;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getIsNew() {
		return isNew;
	}
	public void setIsNew(int isNew) {
		this.isNew = isNew;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getImgUrls() {
		return imgUrls;
	}
	public void setImgUrls(String imgUrls) {
		this.imgUrls = imgUrls;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public float getArea() {
		return area;
	}
	public void setArea(float area) {
		this.area = area;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	
	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}
	@Override
	public String toString() {
		return "House [userId=" + userId + ", price=" + price + ", isNew=" + isNew + ", type=" + type + ", location="
				+ location + ", imgUrls=" + imgUrls + ", hot=" + hot + ", recommend=" + recommend + "]";
	}
	
}
