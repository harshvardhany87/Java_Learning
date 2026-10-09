package cs.repo;

import cs.bean.student;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration // xml

public class studrepo {
    @Bean(name = "s_new") // bean definition like xml based
    public student s1() {
        student s_new = new student();
        s_new.setsetRollNo(1);
        s_new.setName("Harshvardhan Yadav");
        s_new.setMobile("8040806728");

        return s_new;
    }

}
