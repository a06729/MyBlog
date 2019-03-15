package com.pknu.blog;

import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class DataSourceTests {
	
	@Inject
	private DataSource dataSource;
	
	@Test
	public void testConnection(){
		try (Connection con=dataSource.getConnection()){
			System.out.println(con);
		}catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
