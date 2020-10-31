package services;

import dao.userDao;
import vo.user;

import java.util.ArrayList;
import java.util.List;

public class LoginServices {
    public userDao userDao;
    public LoginServices(){
         this.userDao=new userDao();
    }
    public boolean login(String username,String password){
        List<user> list=new ArrayList<>();
        list=this.userDao.selectLogin(username,password);
        if (list.size()>0){
            return true;
        }else {
            return false;
        }
    }
}
