package com.example.demo.controller;

import com.example.demo.service.MovieService;
import com.example.demo.service.TagService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;

@Controller
public class MovieController {

    private final MovieService movieService;
    private final TagService tagService;

    public MovieController(MovieService movieService, TagService tagService) {
        this.movieService = movieService;
        this.tagService = tagService;
    }

    @GetMapping("/movies")
    public String listMovies(
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        model.addAttribute("movies", movieService.getMovies(page));
        model.addAttribute("tags", tagService.getAllTags());
        model.addAttribute("q", "");
        model.addAttribute("tagId", null);

        return "movies";
    }

    @PostMapping("/movies")
    public String addMovie(
            @RequestParam String title,
            @RequestParam
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate releaseDate,
            @RequestParam(required = false) Set<UUID> tagIds) {

        movieService.addMovie(title, releaseDate, tagIds);

        return "redirect:/movies";
    }
}