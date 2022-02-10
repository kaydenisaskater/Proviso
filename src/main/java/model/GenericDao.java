package model;

import java.util.List;

public interface GenericDao<E, K> 
{
	//Insert Record
	void add (E entity);
	
	//Read Record(s)
	List<E> list(); 
	E find(K key);
	
	//Update Record
	void update (E entity);
	
	//Delete Record
	void remove(K key);
}

