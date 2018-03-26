package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Ride;
import model.dao.superInterface.RideDAO;

@Repository("rideDAO")
public class RideDAOHibernate implements RideDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Ride select(int id) {
		return this.getSession().get(Ride.class, id);
	}

	@Override
	public List<Ride> select() {
		return this.getSession().createQuery("FROM Ride", Ride.class).list();
	}

	@Override
	public Integer insert(Ride bean) {
		if (bean != null) {
			return (Integer) this.getSession().save(bean);
		}
		return null;
	}

	@Override
	public Ride update(Ride bean) {
		if (bean != null) {
			Ride result = this.getSession().get(Ride.class, bean.getRideId());
			if(result!=null) {
				result.setRideDate(bean.getRideDate());
				result.setRideTime(bean.getRideTime());
				result.setStart(bean.getStart());
				result.setDest(bean.getDest());
				result.setPickUpZone(bean.getPickUpZone());
				result.setDropOffZone(bean.getDropOffZone());
				result.setDuration(bean.getDuration());
				result.setPrice(bean.getPrice());
				result.setCapacity(bean.getCapacity());
				result.setDriverId(bean.getDriverId());
				result.setCarId(bean.getCarId());
				result.setNote(bean.getNote());
				result.setHistory(bean.getHistory());
				result.setLugPref(bean.getLugPref());
			}
			return result;
		}
		return null;
	}
	
	@Override
	public boolean delete(int id) {
		Ride temp = this.getSession().get(Ride.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
	@Override
	public List<Ride> selectByDrId(int id){
		return this.getSession().createQuery("FROM Ride WHERE driverId= :driverId", Ride.class).setParameter("driverId", id).list();
	}

	public List<Ride> select(String start, Date date) {
		String qry = "FROM Ride R WHERE R.start = :start AND R.rideDate = :date";
		return this.getSession().createQuery(qry, Ride.class)
				.setParameter("start", start)
				.setParameter("date", date)
				.list();
	}
	
	public List<Ride> select(String start, String dest, Date date) {
		String qry = "FROM Ride R WHERE R.start = :start AND R.dest = :dest AND R.rideDate = :date";
		return this.getSession().createQuery(qry, Ride.class)
				.setParameter("start", start)
				.setParameter("dest", dest)
				.setParameter("date", date)
				.list();
	}
	
	public List<Ride> selectCurr(Integer id) {
		String qry = "FROM Ride R WHERE R.driverId = :memberid AND R.rideDate >= :todaydate";
		return this.getSession().createQuery(qry, Ride.class)
				.setParameter("memberid", id)
				.setParameter("todaydate", new Date())
				.list();
	}
	
	public List<Ride> selectFuture() {
		String qry = "FROM Ride R WHERE R.rideDate > :todaydate";
		return this.getSession().createQuery(qry, Ride.class)
				.setParameter("todaydate", new Date())
				.list();
	}
	
	public List<Ride> selectHist(Integer id) {
		String qry = "FROM Ride R WHERE R.driverId = :memberid AND R.rideDate < :todaydate";
		return this.getSession().createQuery(qry, Ride.class)
				.setParameter("memberid", id)
				.setParameter("todaydate", new Date())
				.list();
	}
	
}
