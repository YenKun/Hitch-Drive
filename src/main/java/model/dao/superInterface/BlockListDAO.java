package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.BlockList;

public interface BlockListDAO {

	Session getSession();

	BlockList select(int id);

	List<BlockList> select();

	Integer insert(BlockList bean);

	BlockList update(BlockList bean);

	boolean delete(int id);

	List<BlockList> selectByFromMid(Integer fromMid);

	List<BlockList> selectByToMid(Integer toMid);

	Boolean isBlockExist(BlockList bean);

	Boolean delete(BlockList bean);

}