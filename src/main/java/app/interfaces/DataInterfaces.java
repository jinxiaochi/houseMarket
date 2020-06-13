package app.interfaces;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import app.dao.HouseMapper;
import app.dao.UserMapper;
import app.entity.House;
import app.entity.User;

/**
 * @author jinxiaochi
 * @date  2020年4月22日
 * @effect 获取的数据接口类
 */
@CrossOrigin
@RestController
public class DataInterfaces {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private HouseMapper houseMapper;
	//合法的排序码
	private List<Integer> orderArr = new ArrayList<>();
	public DataInterfaces() {
		orderArr.add(11);
		orderArr.add(12);
		orderArr.add(21);
		orderArr.add(22);
		orderArr.add(31);
		orderArr.add(32);
	}
	/** @effect 登录接口 
	 * @param userName-账户
	 * @param passwd-密码
	 * @return User-登录的用户对象
	 */
	@RequestMapping(path="/login",method=RequestMethod.POST)
	public User Login(String phone,String passwd) {
		//此处密码md5加密(项目完结时候再写)
		User user = userMapper.loginSys(phone, passwd);
		if(user == null) {
			user  = new User();
			user.setUserName("用户名或密码错误用户");
		}
		return user;
	}
	
	@RequestMapping(path="/register",method=RequestMethod.POST)
	public String Register(String name,String phone,String address,String passwd) {
		//此处密码md5加密(项目完结时候再写)
		try {
			//手机号的校验在前端
			userMapper.registerSys(name, phone, address, passwd);
		} catch(DataIntegrityViolationException e){
			return "此手机已被注册";
		}catch (Exception e) {
			return "未知原因注册失败,请联系管理员:\n"+e.getMessage();
		}
		return "注册成功";
	}
	
	@RequestMapping(path="/indexNew",method = RequestMethod.POST)
	public List<House> getIndexNewHouse(){
		return houseMapper.getIndexNewHouse();
	}
	
	@RequestMapping(path="/indexOld",method = RequestMethod.POST)
	public List<House> getIndexOldHouse(){
		return houseMapper.getIndexOldHouse();
	}
	
	/** @effect 发布房子
	 */
	@RequestMapping(path="/publish",method = RequestMethod.POST)
	public String publishHouse(String phone,float price,int isNew,int type,String location,MultipartFile img,String recommend,float area) {
		int userId = userMapper.getUserIdByPhone(phone);
		String fileType = img.getContentType().split("/")[1];
		int count = houseMapper.getUserIdCount(userId)+1;
		//上传功能; transferTo()只能放到classes目录下;图片放在classes下的img;src只是一个备份的基础数据
		ClassPathResource resource = new ClassPathResource("static/imgs/");
		try {
			File file = new File(resource.getFile(),userId+"_"+count+"."+fileType);
			img.transferTo(file);
		} catch (IllegalStateException e) {
			return "图片上传参数不合法";
		} catch (IOException e) {
			e.printStackTrace();
			return "图片上传异常";
		}
		
		try {
			houseMapper.insetrHouse(userId, price, isNew, type, location, userId+"_"+count+"."+fileType, recommend,area);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
		return "发布成功";
	}
	
	@RequestMapping(path="/getHouseDetail",method = RequestMethod.POST)
	public House getHouseDetail(int houseId) {
		House house = houseMapper.getHouseById(houseId);
		if(house==null) {
			house = new House();
			house.setLocation("不存在此房源");
		}
		return house;
	}
	
	@RequestMapping(path="/getHouseCount",method = RequestMethod.POST)
	public int houseCount(Float priceMax,Float priceMin,Float areaMax,Float areaMin,Integer type,Integer isNew,String location) {
		if(priceMax == null) {
			priceMax = new Float(-1);
		}
		if(priceMin == null) {
			priceMin = new Float(-1);
		}
		if(areaMax == null) {
			areaMax = new Float(-1);
		}
		if(areaMin == null) {
			areaMin = new Float(-1);
		}
		if(type==null) {
			type = new Integer(0);
		}
		if(isNew == null) {
			isNew = new Integer(-1);
		}
		if(location ==null) {
			location = "";
		}
		return houseMapper.getHouseCount(priceMax, priceMin, areaMax, areaMin,type,isNew,location);
	}
	
	/** @effect TODO
	 * @param priceMax 最大价格
	 * @param priceMin 最小价格
	 * @param areaMax  最大面积
	 * @param areaMin 最小面加
	 * @param type 户型
	 * @param isNew 二手房/新房
	 * @param location 位置
	 * @param order 排序; 11-价格升序,12-价格降序;   21-面积升序,22-面积降序;   31-户型升序,32-户型降序
	 * @return
	 */
	@RequestMapping(path="/getHouseList",method = RequestMethod.POST)
	public List<House> houseList(Float priceMax,Float priceMin,Float areaMax,Float areaMin,Integer type,
			Integer isNew,String location,Integer order,Integer page) {
		if(priceMax == null) {
			priceMax = new Float(-1);
		}
		if(priceMin == null) {
			priceMin = new Float(-1);
		}
		if(areaMax == null) {
			areaMax = new Float(-1);
		}
		if(areaMin == null) {
			areaMin = new Float(-1);
		}
		if(type==null) {
			type = new Integer(0);
		}
		if(isNew == null) {
			isNew = new Integer(-1);
		}
		
		if(location==null) {
			location = "";
		}
		
		
		if(order==null || !orderArr.contains(order)) {
			order = new Integer(0);
		}
		
		
		if(page == null) {
			page = new Integer(1);
		}
		
		return houseMapper.getHouseList(priceMax, priceMin, areaMax, areaMin, type, isNew,location,order,(page-1)*6);
	}
}
