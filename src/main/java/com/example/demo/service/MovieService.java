package com.example.demo.service;

import com.example.demo.entity.Movie;
import com.example.demo.repository.MovieRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class MovieService {

    private final MovieRepository movieRepository;
    private final TagService tagService;

    public MovieService(MovieRepository movieRepository, TagService tagService) {
        this.movieRepository = movieRepository;
        this.tagService = tagService;
    }

    public Page<Movie> getMovies(int page) {
        return movieRepository.findAll(
                PageRequest.of(page, 5, Sort.by("title").ascending())
        );
    }
}