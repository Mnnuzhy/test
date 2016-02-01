package com.pda.inter;

import java.util.List;

import com.pda.model.Coment;
import com.pda.model.DetailComent;

public interface IComentService {

	public int leaveComent(int sid,String content,int tid,int flag);
	public List<DetailComent> getComent(int tid,int pageNow,int pageSize,int flag);
	public int getPageCount(int flag);
	public void replyComent(int id,int tid,String content);
	public int deleteComent(int id,int flag);
	public List<DetailComent> getComentByTid(int tid,int flag);
	public void deleteAllrComent();
}
