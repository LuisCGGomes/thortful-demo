package com.example.demo.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column (nullable = false)
    private String title;

    private LocalDate releaseDate;

    @ManyToMany
    @JoinTable(
            name = "movie_tag",
            joinColumns = @JoinColumn(name = "movie_id"),
            inverseJoinColumns = @JoinColumn (name = "tag_id")
    )
    private Set<Tag> tags = new HashSet<>();

    protected Movie(){

    }

    public Movie(String title, LocalDate releaseDate){
        this.title = title;
        this.releaseDate = releaseDate;
    }
}
