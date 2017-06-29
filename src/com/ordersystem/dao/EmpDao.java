package com.ordersystem.dao;

import java.util.List;

import com.ordersystem.domain.EmpBeam;

public interface EmpDao {
	public void addEmp(EmpBeam emp);
	public List<EmpBeam> queryAllEmp();
	public List<EmpBeam> queryEmpByName(String name);
}
