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

    public QuizController(IQuestionRepository repo) {
        this.repo = repo;
    }

    @GetMapping("/test")
    public String test(Model model) {
        System.out.println("test wurde aufgerufen");
        Question q = repo.findById(1).get();
        // q.setText("Wie viele Beine hat ein Hund?");
        model.addAttribute("test_attribute", q);
        return "demo_test";
    }

   // @PostMapping("/save")

//    public String save(int aa) {
//        for (Answer a : repo.findById(1).get().getAnwers()) {
//            {
//                if (a.getCorrect()) {
//                    System.out.println("Richtig");
//                } else {
//                    System.out.println("Falsch");
//                }
//            }
//        }
//        return "redirect:/quiz/test";
//
//    }
    @PostMapping("/save")
    public String save(Question q) {
        repo.save(q);
        return "redirect:/quiz/test";
    }
}
