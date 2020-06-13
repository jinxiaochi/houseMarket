package app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import app.entity.House;

/**
 * @author jinxiaochi
 * @date  2020年4月22日
 * @effect House类的mybatis映射类
 */
@Mapper
public interface HouseMapper {
	
	@Select("SELECT * from house WHERE isNew=1 ORDER BY hot DESC LIMIT 3")
	public List<House> getIndexNewHouse();
	
	@Select("SELECT * from house WHERE isNew=0 ORDER BY hot DESC LIMIT 3")
	public List<House> getIndexOldHouse();
	
	@Select("SELECT * from house WHERE isNew=1 ORDER BY hot DESC ")
	public List<House> getAllNewHouse();
	
	@Select("SELECT * from house WHERE isNew=0 ORDER BY hot DESC ")
	public List<House> getAllOldHouse();
	
	@Select("SELECT COUNT(*) FROM house where userId = #{userId}")
	public int getUserIdCount(int userId);
	
	@Insert("INSERT INTO house(userId,price,isNew,type,location,imgUrls,recommend,area) VALUES(#{userId},#{price},#{isNew},#{type},#{location},#{imgUrl},#{recommend},#{area}) ")
	public void insetrHouse(int userId,float price,int isNew,int type,String location,String imgUrl,String recommend,float area);
	
	@Select("SELECT * FROM house WHERE houseId = #{houseId}")
	public House getHouseById(int houseId);
	
	public int getHouseCount(float priceMax,float priceMin,float areaMax,float areaMin,int type,int isNew,String location);
	
	public List<House> getHouseList(float priceMax,float priceMin,float areaMax,float areaMin,int type,int isNew,String location,int order,int offset);
}
