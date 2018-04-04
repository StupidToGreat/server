package dao;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.junit.Assert.assertTrue;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration
public class ISobiDaoTest {
    @Autowired
    ApplicationContext applicationContext;

    @Mock
    ISobiDao sobiDao;

    private MockMvc mockMvc;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(sobiDao).build();
    }

    @Test
    public void sobiDaoTest() throws Exception {
        assertTrue(sobiDao.sobiList() != null);
    }
}
