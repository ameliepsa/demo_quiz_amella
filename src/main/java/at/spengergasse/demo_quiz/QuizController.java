package at.spengergasse.demo_quiz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    private IQuestionRepository repo;
    private int id = 1;

    public QuizController(IQuestionRepository repo) {
        this.repo = repo;
    }

    Question q;

    @GetMapping("/test")
    public String test(Model model) {
        System.out.println("test wurde aufgerufen");
        q = repo.findById(id).get();
        model.addAttribute("test_attribute", q);
        return "demo_test";
    }

    int score = 0;

    @PostMapping("/save")
    public String save(int answer) {
        for (Answer a : q.getAnswers()) {
            if (a.getCorrect() && a.getId() == answer) {
                score++;
            }
        }

        if (id >= 5) {
            return "redirect:/quiz/end";
        }
        else{
            id++;
            return "redirect:/quiz/test";
        }
    }

    @GetMapping("/end")
    public String end(Model model) {
        model.addAttribute("score", score);
        return "endpage";

    }

}


