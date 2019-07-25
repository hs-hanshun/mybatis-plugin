package cn.hassan.dao;

import cn.hassan.pojo.User;
import cn.hassan.vo.QueryVo;

public interface UserMapper {

	User findUserById(Integer id);

	User findUserByUsername(QueryVo vo);

	User findUserOrders(Integer id);
}
