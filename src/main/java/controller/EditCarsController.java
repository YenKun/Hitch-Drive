package controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import model.bean.Car;
import model.bean.Member;
import model.service.CarService;
import model.service.MemberService;

@RestController
@RequestMapping(path = { "/editCar" })
public class EditCarsController {
	@Autowired
	private CarService cs;
	@Autowired
	private MemberService ms;
	@ResponseBody
	@RequestMapping(path = { "/insertCar.controller" }, method = { RequestMethod.POST }, produces = {
			"application/json" })
	public Map<String, String> insertCars(Car car,HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		Member member1 = ms.getMemberInfo(memberInfo.getMid()); 
		Map<String, String> map = new HashMap<String,String>();
		if(car.getCarNo()!=null && car.getCarNo().trim().length()!=0) {
			if(member1.getCurrentLv()==3) {
				List<Car> cars = cs.selectMemberCars(member1);
				if(cars.size()<3) {
					Car selectCar = cs.selectCarByNo(car.getCarNo());
					if(selectCar ==null) {
						car.setMid(member1.getMid());
						cs.insertCar(car);
						map.put("msg", "新增車輛完成");
					}else {
						map.put("er", "車輛已經存在");
					}
				}else {
					map.put("er", "車輛最大數為3輛");
				}
			}else {
				map.put("er", "權限不足");
			}
			return map;
		}else {
			return null;
		}
			
	}
	
	@ResponseBody
	@RequestMapping(path = { "/updateCar.controller" }, method = { RequestMethod.POST }, produces = {"application/json" })
	public Map<String, String> updateCars(Car car, HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		Map<String, String>map =new HashMap<>();
		if(memberInfo!=null) {
			Car car1 = cs.selectCar(car.getCarId());
			if(car1.getMid() == memberInfo.getMid()) {
				if(car.getCarBrand()==null||car.getCarBrand().trim().length()==0) {
					map.put("er354", "not null");
				}
				else if(car.getCarNo()==null||car.getCarNo().trim().length()==0){
					map.put("er355", "not null");
				}
				else if(car.getColor()==null||car.getColor().trim().length()==0){
					map.put("er356", "not null");
				}
				else if(car.getCarType()==null || car.getCarType().trim().length()==0){
					map.put("er357", "not null");
				}
				if(map.isEmpty()) {
					car.setMid(memberInfo.getMid());
					if(cs.updateCar(car)) {
						map.put("msg", "edit success");
					}
					else {
						map.put("er", "edit fail");
					}
					return map;
				}else {
					return map;
				}
			}else {
				map.put("er", "edit fail");
			}
			return map;
		}else {
			return null;}
	}
	
	@ResponseBody
	@RequestMapping(path = { "/deleteCar.controller" }, method = { RequestMethod.DELETE }, produces = {"application/json" })
	public Map<String, String> deleteCars(@RequestBody String carId, HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		Map<String, String> map = new HashMap<String,String>();
		String carId1 = carId.split("=")[1];
		Integer id = Integer.parseInt(carId1);
		if(memberInfo!=null) {
			if (cs.checkCar(id)) {
				Car car = cs.selectCar(id);
				if (car.getMid() == memberInfo.getMid()) {
					cs.deleteCar(car);
					map.put("msg005", "delete sucess");
				}else {
					map.put("er014", "這台車不是您的");}
			} else {
				map.put("er013", "沒有這個車");
			}
				return map;
			}	
			return null;
	}

	@ResponseBody
	@RequestMapping(path = { "/showCar.controller" }, method = { RequestMethod.GET }, produces = { "application/json" })
	public List<Car> showCars(HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		if(memberInfo!=null) {
			List<Car> cars = cs.selectMemberCars(memberInfo);
			for(Car carNoP :cars) {
				carNoP.setCarDocPhoto(null);
			}
			return cars;
		}
	return null;
	}
	
	@ResponseBody
	@RequestMapping(path= {"/uploadDocPhoto.controller"},method= {RequestMethod.POST})
	public Map<String, String> uploadDocPhoto(@RequestParam("carDocPhoto")MultipartFile file,@RequestParam("carId")Integer carID,HttpSession session) {
		Map<String, String>map = new HashMap<>();
			System.out.println(file.getName());
		if(!file.isEmpty()) {
				String fileType = file.getContentType();
				String type =fileType.split("/")[1];
				if(type.equals("jpeg")||type.equals("gif")||type.equals("png")) {
					Blob blob = null;
					try {
						byte[] img = file.getBytes();
						blob = new SerialBlob(img);
						cs.uploadDocPhoto(blob, carID);
						map.put("msg004", "uploadSucess");
					} catch (Exception e) {
						map.put("er007", "upload file fail");
					}
				}else {
					map.put("er008", "Type:jpeg、png、gif");
				}
			}else {
				map.put("er009", "file is empty");
			}
			return map;
		
	}
}
