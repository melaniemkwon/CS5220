package formbuilder.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import formbuilder.model.Form;
import formbuilder.model.Page;
import formbuilder.model.dao.FormDao;


@Repository
public class FormDaoImp implements FormDao {
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
    public List<Form> getForms(){
		
        return entityManager.createQuery( "from form order by id", Form.class )
            .getResultList();
    }
	
	@Override
	public Form getForm( Integer id ) {
		return entityManager.find(Form.class, id);
	}
	
	@Override
	@Transactional
	public Form saveForm( Form form ) {
		return entityManager.merge(form);
	}

	@Override
	public Page savePage(Page page) {
		// TODO Auto-generated method stub
		return null;
	}
}
