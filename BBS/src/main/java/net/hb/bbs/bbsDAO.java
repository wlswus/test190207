package net.hb.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class bbsDAO {
	
	@Autowired
	SqlSessionTemplate temp;

	public void dbInsert(bbsDTO dto) {
		temp.insert("bbs.add",dto);
	}
	
	public List<bbsDTO> dbSelect(int start, int end) {
		bbsDTO dto = new bbsDTO();
		dto.setStart(start);
		dto.setEnd(end);
		List<bbsDTO> list = temp.selectList("bbs.selectAll",dto);
		return list;
	}
	
	public List<bbsDTO> dbSelect(int start, int end, String skey, String sval) {
		bbsDTO dto = new bbsDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		List<bbsDTO> list = temp.selectList("bbs.selectAllDynamic",dto);
		return list;
	}
	
	public int dbCount() {
		int cnt = (Integer)temp.selectOne("bbs.countAll");
		return cnt;
	}
	
	public int dbCountSearch(String skey, String sval) {
		bbsDTO dto = new bbsDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		int cnt = (Integer) temp.selectOne("bbs.countAllSearch", dto);
		return cnt;
	}
	
	public bbsDTO dbDetail(int data) {
		bbsDTO dto = temp.selectOne("bbs.detail", data);
		return dto;
	}
	
	public void dbEdit(bbsDTO dto) {
		temp.update("bbs.edit",dto);
	}
	
	public void dbDelete(int data) {
		temp.delete("bbs.del", data);
	}// end


}
