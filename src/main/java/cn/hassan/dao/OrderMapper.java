package cn.hassan.dao;

import java.util.List;
import cn.hassan.pojo.Orders;
import cn.hassan.pojo.User;

public interface OrderMapper {
	
	
    //	查询订单表order的所有数据
	List<Orders> selectOrdersList();
	
	//一对一关联 查询  以订单为中心 关联用户
	List<Orders> selectOrders();

	Orders findOrderAndUser(Integer orderId);
	
	//一对多关联
	List<User> selectUserList();

	List<User> findUserByTerm(User user);
}
