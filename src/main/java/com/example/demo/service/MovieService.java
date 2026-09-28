package com.example.demo.service;

import com.example.demo.repository.MovieRepository;
import org.springframework.stereotype.Service;

@Service
public class MovieService {

    private final MovieRepository movieRepository;
    private final TagService tagService;

    public MovieService(MovieRepository movieRepository, TagService tagService) {
        this.movieRepository = movieRepository;
        this.tagService = tagService;
    }
}