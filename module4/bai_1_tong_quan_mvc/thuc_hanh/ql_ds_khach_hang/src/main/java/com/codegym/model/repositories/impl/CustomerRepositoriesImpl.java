package com.codegym.model.repositories.impl;

import com.codegym.model.bean.Customer;
import com.codegym.model.repositories.CustomerRepositories;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CustomerRepositoriesImpl implements CustomerRepositories {
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("0","Nguyễn Văn A","nva@gmail.com","Đà nẵng"));
        customerList.add(new Customer("1","Nguyễn Văn B","nvb@gmail.com","Quảng Nam"));
        customerList.add(new Customer("2","Nguyễn Văn C","nvc@gmail.com","Huế"));
        customerList.add(new Customer("3","Nguyễn Văn D","nvd@gmail.com","Đà nẵng"));
        customerList.add(new Customer("4","Nguyễn Văn E","nve@gmail.com","Đà nẵng"));
    }
    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public Customer findById(String id) {
        int index = findId(id);
        return customerList.get(index);
    }

    @Override
    public void save(Customer customer) {
        customerList.add(customer);
    }

    @Override
    public void update(Customer customer) {
        String id = customer.getId();
        int index = findId(id);
        customerList.get(index).setName(customer.getName());
        customerList.get(index).setEmail(customer.getEmail());
        customerList.get(index).setAddress(customer.getAddress());
    }

    @Override
    public void delete(String id) {
        int index = findId(id);
        customerList.remove(index);
    }

    @Override
    public int findId(String id) {
        for(int i=0; i<customerList.size(); i++){
            if(id.equals(customerList.get(i).getId())) return i;
        }
        return -1;
    }
}
