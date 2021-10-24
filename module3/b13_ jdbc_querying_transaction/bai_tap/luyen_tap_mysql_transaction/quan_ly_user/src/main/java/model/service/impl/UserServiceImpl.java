package model.service.impl;

import model.bean.User;
import model.repositories.UserRepositories;
import model.repositories.impl.UserRepositoriesImpl;
import model.service.UserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepositoriesImpl userRepositories = new UserRepositoriesImpl();

    @Override
    public void addNewUserTransaction(User user, int[] permisions) {
        userRepositories.addNewUserTransaction(user,permisions);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userRepositories.insertUpdateWithoutTransaction();
    }

    @Override
    public void addNewUser(User user) {
        userRepositories.addNewUser(user);
    }

    @Override
    public User findById(int id) {
        return userRepositories.findById(id);
    }

    @Override
    public List<User> findAllUsers() {
         return userRepositories.findAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepositories.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepositories.updateUser(user);
    }

    @Override
    public User getUserById(int id) {
        return userRepositories.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) {
        userRepositories.insertUserStore(user);
    }

    public List<User> sort(){
        return userRepositories.sort();
    }
}
