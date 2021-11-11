package com.Service;

import com.Model.Role;
import com.Model.User;
import com.Repository.UserRepository;
import freemarker.template.utility.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository repository;

    @Autowired
    MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        return repository.findByUsername(userName);
    }

    public boolean addUser(User user){
        User userFromDB = repository.findByUsername(user.getUsername());

        if (userFromDB != null){
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        repository.save(user);

        if(!StringUtils.isEmpty(user.getUserMail())){
            String message = String.format("Hay %s !!!\n" +
                    "Your activation code - http://localhost:8080/activate/%s",
                    user.getUsername(), user.getActivationCode());
            mailSender.send(user.getUserMail(),"Activation", message );
            System.out.println("send message-------------------------------------------");
        }

        return true;
    }

    public boolean activateUser(String code) {
        User user = repository.findByActivationCode(code);
        if (user == null){
            return false;
        }

        user.setActivationCode(null);
        repository.save(user);


        return true;
    }
}
