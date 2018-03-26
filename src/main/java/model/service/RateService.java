package model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.bean.PassDetail;
import model.bean.Rate;
import model.bean.Ride;
import model.dao.superInterface.MemberDAO;
import model.dao.superInterface.PassDetailDAO;
import model.dao.superInterface.RateDAO;
import model.dao.superInterface.RideDAO;

@Transactional
@Service
public class RateService {

	@Autowired
	private RateDAO rateDao;
	@Autowired
	private RideDAO rideDao;
	@Autowired
	private PassDetailDAO passDetailDao;
	@Autowired
	private MemberDAO memberDao;

	public HashMap<String, List> getLeftRatings(Integer fromMid) {
		List<Rate> rates = rateDao.selectByFromMid(fromMid);
		HashMap<String, List> response = new HashMap<>();
		response.put("rates", rates);
		if (!rates.isEmpty()) {
			ArrayList<HashMap<String, String>> memberInfos = new ArrayList<HashMap<String, String>>();
			for (Rate rate : rates) {
				Member member = memberDao.select(rate.getToMid());
				if (member != null) {
					HashMap<String, String> temp = new HashMap<>();
					temp.put("firstName", member.getFirstName());
					temp.put("lastName", member.getLastName());
					memberInfos.add(temp);
				}
			}
			response.put("memberInfos", memberInfos);
		}
		return response;
	}

	public HashMap<String, List> getReceivedRatings(Integer toMid) {
		List<Rate> rates = rateDao.selectByToMid(toMid);
		HashMap<String, List> response = new HashMap<>();
		response.put("rates", rates);
		if (!rates.isEmpty()) {
			ArrayList<HashMap<String, String>> memberInfos = new ArrayList<HashMap<String, String>>();
			for (Rate rate : rates) {
				Member member = memberDao.select(rate.getFromMid());
				if (member != null) {
					HashMap<String, String> temp = new HashMap<>();
					temp.put("firstName", member.getFirstName());
					temp.put("lastName", member.getLastName());
					memberInfos.add(temp);
				}
			}
			response.put("memberInfos", memberInfos);
		}
		return response;
	}

	// 觀看別人
	public Member getMember(Integer id) {
		System.out.println("RateService");
		System.out.println("RateService" + memberDao.select(id));
		return memberDao.select(id);
	}

	public boolean rateMember(Rate bean) {
		if (bean != null) {

			if (bean.getRideId() != null) {
				Ride ride = rideDao.select(bean.getRideId());
				if (ride != null) {

					if (ride.getRideDate() != null && ride.getRideTime() != null) {
						long date = ride.getRideDate().getTime();
						long time = ride.getRideTime().getTime();
						int limit = 1000 * 60 * 60 * 24 * 7;
						if (System.currentTimeMillis() < date + time + limit) {

							ArrayList<Integer> memberIds = new ArrayList<Integer>();
							memberIds.add(ride.getDriverId());
							List<PassDetail> passengers = passDetailDao.selectByRideId(bean.getRideId());
							if (passengers != null) {
								for (PassDetail passenger : passengers) {
									memberIds.add(passenger.getMid());
								}
							}
							if (memberIds.indexOf(bean.getFromMid()) != -1
									&& memberIds.indexOf(bean.getToMid()) != -1) {

								if (!rateDao.isRateExist(bean)) {
									rateDao.insert(bean);
									if (updateRating(bean)) {
										return true;
									}
								}
							}
						}
					}
				}
			}
		}
		return false;
	}

	public boolean updateRating(Rate bean) {
		if (bean != null) {
			Member member = memberDao.select(bean.getToMid());
			if (member != null) {
				Integer rateReceived = 0;
				Double rate = bean.getStar() / 1.0;
				if (member.getRate() != null && member.getRateReceived() != null) {
					rateReceived = member.getRateReceived();
					rate = (member.getRate() * rateReceived + bean.getStar()) / (rateReceived + 1);
				}
				member.setRate(rate);
				member.setRateReceived(rateReceived + 1);
				memberDao.update(member);
				return true;
			}
		}
		return false;
	}
}
