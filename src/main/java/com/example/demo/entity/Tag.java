package com.example.demo.entity;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false, unique = true)
    private String name;

    protected Tag(){

    }

    public Tag(String name){
        this.name = name;
    }
}
