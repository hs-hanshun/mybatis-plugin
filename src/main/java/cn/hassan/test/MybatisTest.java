package cn.hassan.test;

import cn.hassan.dao.OrderMapper;
import cn.hassan.dao.UserMapper;
import cn.hassan.pojo.Orders;
import cn.hassan.pojo.User;
import cn.hassan.vo.QueryVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class MybatisTest {

	private SqlSessionFactory sqlSessionFactory = null;

	@Before
	public void init() {
		try {
			String path = "sqlMapConfig.xml";
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			InputStream inputStream = Resources.getResourceAsStream(path);
			sqlSessionFactory = builder.build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void associationTestTwo() {
		// 获取sqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 获取OrderMapper
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		// 执行查询
		Orders orderAndUser = orderMapper.findOrderAndUser(5);
		System.out.println(orderAndUser.toString());
	}

	@Test
	public void collectionTestTwo(){
		// 获取sqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 获取OrderMapper
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		User userOrders = userMapper.findUserOrders(1);
		System.out.println(userOrders.toString());
	}

	@Test
	public void findUserByUsernameMapper() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		QueryVo vo = new QueryVo();
		User user = new User();
		user.setUsername("小明");
		vo.setUser(user);
		User result = mapper.findUserByUsername(vo);
		System.out.println(result);
		sqlSession.close();
	}

	@Test
	public void findUserByIdMapper() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		User user = mapper.findUserById(36);
		System.out.println(user);
		sqlSession.close();
	}

	@Test
	public void associationTest() {
		// 获取sqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 获取OrderMapper
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		// 执行查询
		Orders orders = orderMapper.selectOrders(5);
		System.out.println(orders);
	}

	@Test
	public void collectionTest() {
		// 获取sqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 获取OrderMapper
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		// 执行查询
		List<User> list = orderMapper.selectUserList();
		for (User order : list) {
			System.out.println(order);
		}
	}

	@Test
	public void testQueryUserByWhere() {
		// mybatis和spring整合，整合之后，交给spring管理
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		// 创建Mapper接口的动态代理对象，整合之后，交给spring管理
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);

		// 使用userMapper执行根据条件查询用户
		User user = new User();
		user.setSex("1");
		user.setUsername("张");

		List<User> list = orderMapper.findUserByTerm(user);

		for (User u : list) {
			System.out.println(u);
		}
		// mybatis和spring整合，整合之后，交给spring管理
		sqlSession.close();
	}

	@Test
	public void testQueryAll() {
		// 获取sqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 获取OrderMapper
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		// 执行查询
		List<Orders> list = orderMapper.selectOrdersList();
		for (Orders order : list) {
			System.out.println(order);
		}
	}

	///////////////////////////////////////////////////////////

	@Test
	public void deleteUser() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("deleteUserById", 25);
		sqlSession.commit();
		sqlSession.close();
	}

	@Test
	public void updateUser() {
		User user = new User();
		user.setId(22);
		user.setUsername("sherry");
		user.setBirthday(new Date());
		user.setSex("1");
		user.setAddress("浙江杭州");

		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("updateUserById", user);
		System.out.println(user);
		//需要提交才能更新到数据库
		sqlSession.commit();
		sqlSession.close();
	}

	@Test
	public void insertUser() {
		User user = new User();
		user.setUsername("hassan");
		user.setBirthday(new Date());
		user.setSex("1");
		user.setAddress("浙江杭州");

		SqlSession sqlSession = sqlSessionFactory.openSession();
		int id = sqlSession.insert("insertUser",user);
		System.out.println(user);
		//需要提交才能插入到数据库
		sqlSession.commit();
		sqlSession.close();
	}

	@Test
	public void findByUsername() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Object> user = session.selectList("findUserByUsername", "小明");
		for (Object u : user) {
			System.out.println(u);
		}
		session.close();
	}

	@Test
	public void findUserById() {
		SqlSession session = sqlSessionFactory.openSession();
		Object user = session.selectOne("findUserById", 1);
		System.out.println(user);
		session.close();
	}
}
