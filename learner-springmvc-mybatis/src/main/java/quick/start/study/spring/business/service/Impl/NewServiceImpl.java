package quick.start.study.spring.business.service.Impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import quick.start.study.spring.business.dao.INewDao;
import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.service.INewService;

@Service("newService")
public class NewServiceImpl implements INewService {

    @Resource  
    private INewDao newDao;

    public int addNew(New newBean) {
        return newDao.addNew(newBean);
    }

    public List<New> getAllNewLetterList() {
        return newDao.getAllNewLetterList();
    }

    public int byIdDeleteNew(String newId) {
        return newDao.byIdDeleteNew(newId);
    }

    public New byIdQueryNew(String newId) {
       return newDao.byIdQueryNew(newId);
    }

    public int editNew(New newBean) {
        return newDao.editNew(newBean.getNewId(),newBean.getNewTitle(),newBean.getNewDetails(),newBean.getPushTime()
                ,newBean.getThumbnails(),newBean.getTypeId(),newBean.getFlowUpTop());
    }
}