package at.spengergasse.demo_quiz;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "q_questions", schema = "demo_quiz", catalog = "")
public class Question {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "q_id")
    private int id;
    @Basic
    @Column(name = "q_text")
    private String text;
    @OneToMany
    @JoinColumn(name = "a_question_id")
    private Collection<Answer> answers;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String qText) {
        this.text = qText;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Question question = (Question) o;

        if (id != question.id) return false;
        if (text != null ? !text.equals(question.text) : question.text != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }

    public Collection<Answer> getAnwers() {
        return answers;
    }

    public void setAnwers(Collection<Answer> anwers) {
        this.answers = answers;
    }
}
