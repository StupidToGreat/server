package service;

import dao.ISobiDao;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.junit.Assert.assertTrue;

public class SobiServiceTest {
    @Autowired
    ApplicationContext applicationContext;

    @Mock
    ISobiDao sobiDao;
    @InjectMocks
    SobiService sobiService;

    private MockMvc mockMvc;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(sobiService).build();
    }

    @Test
    public void sobiDaoTest() throws Exception {
        assertTrue(sobiService.getAllSobiSum("010-9918-9249") != null);
    }
}
