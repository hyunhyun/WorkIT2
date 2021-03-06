package com.spring.dao;

import java.util.List;

public interface GenericDAO<E, K> {

	public K getTime();

	public void register(E vo);

	public E get(K userid);

	public List<E> getList();
	// 아래는 등록, 조회 구현 이후에 할 것임..
	//public void update();
	//public void delete();

	public List<E> getListAutoComplete(K search);
	
	public int deleteMember(K memberID);
}// interface
