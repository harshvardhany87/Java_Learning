package cs.main;

import cs.bean.student;
import cs.repo.studrepo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Springjava {
    public static void main(String args[]) {

        ApplicationContext context = new AnnotationConfigApplicationContext(studrepo.class);
        student s = (student) context.getBean("s_new");
        s.display();

    }

}
