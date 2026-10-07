package cs.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cs.bean.stud;

public class springxml {

    public static void main(String[] args) {

        String path = "cs/config/app.xml";

        ApplicationContext context = new ClassPathXmlApplicationContext(path);

        stud s1 = (stud) context.getBean("stud1");

        s1.display();
    }
}