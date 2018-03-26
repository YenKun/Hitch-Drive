package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.BlockList;
import model.dao.superInterface.BlockListDAO;

@Repository("blockListDao")
public class BlockListDAOHibernate implements BlockListDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public BlockList select(int id) {
		return this.getSession().get(BlockList.class, id);
	}

	@Override
	public List<BlockList> select() {
		return this.getSession().createQuery("From BlockList", BlockList.class).list();
	}

	@Override
	public List<BlockList> selectByFromMid(Integer fromMid) {
		if (fromMid != null) {
			return this.getSession().createQuery("FROM BlockList WHERE fromMid = :fromMid", BlockList.class)
					.setParameter("fromMid", fromMid).list();
		}
		return null;
	}

	@Override
	public List<BlockList> selectByToMid(Integer toMid) {
		if (toMid != null) {
			return this.getSession().createQuery("FROM BlockList WHERE toMid = :toMid", BlockList.class)
					.setParameter("toMid", toMid).list();
		}
		return null;
	}

	@Override
	public Boolean isBlockExist(BlockList bean) {
		if (bean != null && bean.getFromMid() != null && bean.getToMid() != null) {
			if (this.getSession()
					.createQuery("FROM BlockList WHERE fromMid = :fromMid AND toMid = :toMid", BlockList.class)
					.setParameter("fromMid", bean.getFromMid()).setParameter("toMid", bean.getToMid())
					.uniqueResult() != null) {
				return true;
			}
		}
		return false;
	}

	@Override
	public Integer insert(BlockList bean) {
		if (bean != null) {
			return (Integer) this.getSession().save(bean);
		}
		return null;
	}

	@Override
	public BlockList update(BlockList bean) {
		if (bean != null) {
			BlockList result = this.getSession().get(BlockList.class, bean.getBlockId());
			if (result != null) {
				result.setFromMid(bean.getFromMid());
				result.setToMid(bean.getToMid());
			}
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		BlockList temp = this.getSession().get(BlockList.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
	
	@Override
	public Boolean delete(BlockList bean) {
		if (bean != null && bean.getFromMid() != null && bean.getToMid() != null) {
			BlockList temp = this.getSession()
			.createQuery("FROM BlockList WHERE fromMid = :fromMid AND toMid = :toMid", BlockList.class)
			.setParameter("fromMid", bean.getFromMid()).setParameter("toMid", bean.getToMid())
			.uniqueResult();
			if (temp != null) {
				this.getSession().delete(temp);
				return true;
			}
		}
		return false;
	}
	
	
}
