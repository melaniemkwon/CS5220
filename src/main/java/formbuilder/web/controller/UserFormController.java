package formbuilder.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import formbuilder.model.core.User;
import formbuilder.model.core.dao.UserDao;
import formbuilder.model.questionform.Answer;
import formbuilder.model.questionform.ChoiceAnswer;
import formbuilder.model.questionform.Form;
import formbuilder.model.questionform.Question;
import formbuilder.model.questionform.TextAnswer;
import formbuilder.model.questionform.dao.FormDao;

@Controller
@SessionAttributes({ "form", "question" })
public class UserFormController {
	@Autowired
	private FormDao formDao;

	@Autowired
	private UserDao userDao;

	@RequestMapping("/userForm/listForm.html")
	public String listForm(@RequestParam Integer id, ModelMap models) {

		models.put("user", userDao.getUser(id));

		Set<Form> forms = userDao.getUser(id).getForms();

		models.put("forms", forms);

		return "userForm/listForm";
	}

	@RequestMapping(value = "/userForm/fillForm.html", method = RequestMethod.GET)
	public String fillForm(@RequestParam Integer uId, @RequestParam Integer fId, @RequestParam Integer pageNum,
			ModelMap models) {
		System.out.println("fillForm");
		User user = userDao.getUser(uId);
		Form form = formDao.getForm(fId);
		List<Answer> answers = formDao.getAnswers(user, form);
		List<Question> questions = form.getQuestions();
		int index = 0;


		if (questions.size() != answers.size()) {
			List<Answer> addedAnswers = new ArrayList<Answer>();
			for (Question question : questions) {
				if (index >= answers.size() || !answers.get(index).getQuestion().equals(question)) {
					if (question.getType().equals("TEXT")) {
						TextAnswer newAnswer = new TextAnswer();
						newAnswer.setForm(form);
						newAnswer.setUser(user);
						newAnswer.setPageNumber(pageNum);
						newAnswer.setQuestion(question);
						addedAnswers.add(newAnswer);
					} else if (question.getType().equals("CHOICE")) {
						ChoiceAnswer newAnswer = new ChoiceAnswer();
						newAnswer.setForm(form);
						newAnswer.setUser(user);
						newAnswer.setPageNumber(pageNum);
						newAnswer.setQuestion(question);
						addedAnswers.add(newAnswer);
					}
				} else
					index++;

			}
			models.put("answers", addedAnswers);
		} else
			models.put("answers", answers);

		models.put("form", form);


		return "userForm/fillForm";
	}

	@RequestMapping(value = "/form/fillForm.html", method = RequestMethod.POST)
	public String fillForm(@ModelAttribute Form form, @ModelAttribute List<Answer> answers,
			SessionStatus sessionStatus) {

		formDao.saveForm(form);
		sessionStatus.setComplete();
		return "redirect:listForm.html";
	}
}
