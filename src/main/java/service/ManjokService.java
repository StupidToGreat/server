package service;

import java.util.HashMap;
import java.util.List;


import dao.IManjokDao;
import model.Manjok;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.IManjokDao;
  
  
@Service("manjokService")
public class ManjokService implements IManjokService {
	@Autowired 
	private IManjokDao manjokDao;
 
	@Override
	public int dailyManjokCheck(String day, int memIdx) {
	 
		HashMap<String, Object> params = new HashMap<>();
		params.put("day", day);
		params.put("memIdx", memIdx);
		int check = manjokDao.dailyManjokCheck(params);
		return check ;
	}

	@Override
	public int getManjokScore(String day, int memIdx) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("day", day);
		params.put("memIdx", memIdx);
		int score = manjokDao.getManjokScore(params);
		return score ;
	}
    
	@Override
	public int setManjokScore(String day, int memIdx, int score) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("day", day);
		params.put("memIdx", memIdx);
		params.put("score",score);
	    manjokDao.setManjokScore(params);    
		return 0;
	}

	@Override
	public float getMonthlyManjokScore(int year, int month, int memIdx) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("year", year);
		params.put("month",month);
		params.put("memIdx",memIdx);
		float score = manjokDao.getMonthlyManjokScore(params);
		return score;
	}

	@Override
	public List<Manjok> getManjokList(int year, int month, int memIdx) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("year", year);
		params.put("month",month+1);
		params.put("memIdx",memIdx);

		List<Manjok> manjokList = manjokDao.getManjokList(params);

		return manjokList;
	}


}
    