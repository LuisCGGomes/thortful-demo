package com.example.demo.service;

import com.example.demo.entity.Movie;
import com.example.demo.repository.MovieRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;

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

    @Transactional
    public void addMovie(String title, LocalDate releaseDate, Set<UUID> tagIds) {
        if (title == null || title.isBlank()) {
            throw new IllegalArgumentException("Title is required.");
        }

        if (releaseDate == null) {
            throw new IllegalArgumentException("Release date is required.");
        }

        Movie movie = new Movie(title.strip(), releaseDate);
        movie.setTags(tagService.getTagsByIds(tagIds));

        movieRepository.save(movie);
    }
}