package model.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Car;
import model.bean.Member;
import model.dao.superInterface.CarDAO;
import model.dao.superInterface.VerificationDAO;

@Transactional
@Service
public class CarService {
	@Autowired
	private CarDAO cardao;
	
	public Car select(int cid) {
		return cardao.select(cid);
	}
	
	public List<Car> selectByMember(int mid) {
		return cardao.selectByMember(mid);
	}
	
	
	public Car selectCar(Member bean) {
		return cardao.select(bean.getMid());

	}
	public Car selectCar(Integer carId) {
		return cardao.select(carId);

	}

	public Car selectCarByNo(String carNo) {
		return cardao.select(carNo);

	}

	public Integer insertCar(Car bean) {
		return cardao.insert(bean);

	}

	public boolean updateCar(Car bean) {
		Car car = cardao.select(bean.getCarId());
		if(car.getMid()==bean.getMid()) {
//			車牌不一樣
			if( !(car.getCarNo().equals(bean.getCarNo())))
			{
				car.setCarNo(bean.getCarNo());
				car.setCarBrand(bean.getCarBrand());
				car.setCarType(bean.getCarType());
				car.setColor(bean.getColor());
				car.setPcFriendly(bean.getPcFriendly());
				car.setCarDocVerified(null);
				car.setCarDocPhoto(null);
				return true;
			}
//			車子不一樣
			else if(!(car.getCarBrand().equals(bean.getCarBrand()) && car.getCarType().equals(bean.getCarType())))		
			{
				car.setCarNo(bean.getCarNo());
				car.setCarBrand(bean.getCarBrand());
				car.setCarType(bean.getCarType());
				car.setColor(bean.getColor());
				car.setPcFriendly(bean.getPcFriendly());
				car.setCarDocVerified(null);
				car.setCarDocPhoto(null);
				return true;
			}else {
				car.setColor(bean.getColor());
				car.setPcFriendly(bean.getPcFriendly());
				return true;
			}
		}
		return false;
	}

	public boolean deleteCar(Car bean) {
		return cardao.delete(bean.getCarId());
	}

	public List<Car> selectMemberCars(Member memberInfo) {
		return cardao.selectByMid(memberInfo.getMid());
	}

	public boolean checkCar(Integer carId) {
		Car car = cardao.select(carId);
		if (car != null) {
			return true;
		}
			return false;
	}
	public boolean uploadDocPhoto(Blob blob ,Integer carId) {
		Car car=cardao.select(carId);
		if(car!=null) {
			car.setCarDocPhoto(blob);
			car.setCarDocVerified(false);
			return true;
		}return false;
	}
	
	public Blob getDocPhoto(Integer carId ) {
	Car car=	cardao.select(carId);
	return car.getCarDocPhoto();
	}
	
	public List<Car> getAllCarNoVerify(){
		return cardao.selectNoVerify();
	}

	
	
	public Boolean setCarDocVerify(Integer carId) {
		Car car = cardao.select(carId);
		car.setCarDocVerified(true);
		return true;
	}
	
}
