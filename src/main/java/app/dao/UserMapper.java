package app.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import app.entity.User;

/**
 * @author jinxiaochi
 * @date  2020年4月22日
 * @effect User的mybatis映射类
 */
@Mapper
public interface UserMapper {
	
	@Select("select * from user where  phoneNum = #{phone} and passwd = #{passwd}")
	public User loginSys(String phone,String passwd);
	
	@Insert("insert into user(name,PhoneNum,address,passwd) values(#{name},#{phone},#{address},#{passwd})")
	public void registerSys(String name,String phone,String address,String passwd);
	
	@Select("select userId from user where phoneNum = #{phone}")
	public int getUserIdByPhone(String phone);
}
