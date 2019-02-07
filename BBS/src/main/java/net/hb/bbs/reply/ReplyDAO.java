package net.hb.bbs.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbInsert(ReplyDTO dto) {
		System.out.println("댓글dao 넘어온idx="  + dto.getB_no());
		System.out.println("댓글dao 넘어온저자="  + dto.getBr_id());
		System.out.println("댓글dao 넘어온메모="  + dto.getBr_content());
		temp.insert("bbs_reply.add", dto);
	}
	
	public List<ReplyDTO> dbSelect(int idx) {
		List<ReplyDTO> rlist = null;
		rlist = temp.selectList("bbs_reply.selectAll", idx);
		return rlist;
	}
	
	public ReplyDTO dbDetail(int idx) {
		ReplyDTO dto = temp.selectOne("bbs_reply.selectOne", idx);
		return dto;
	}
	
	public void dbDelete(int idx) {
		temp.delete("bbs_reply.del", idx);
	}
	
	public void dbUpdate(ReplyDTO dto) {
		temp.update("bbs_reply.edit", dto);
	}
}
