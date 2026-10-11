package com.example.demo.repository;

import com.example.demo.entity.Movie;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.UUID;

public interface MovieRepository extends JpaRepository<Movie, UUID> {
    @Query("""
    SELECT m FROM Movie m
    WHERE (:q = '' OR LOWER(m.title) LIKE LOWER(CONCAT('%', :q, '%')))
      AND (:tagId IS NULL OR EXISTS (
          SELECT t.id FROM Movie other
          JOIN other.tags t
          WHERE other.id = m.id AND t.id = :tagId
      ))
    """)
    Page<Movie> search(
            @Param("q") String q,
            @Param("tagId") UUID tagId,
            Pageable pageable);
    
}