package com.example.demo.service;

import com.example.demo.entity.Tag;
import com.example.demo.repository.TagRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Service
public class TagService {

    private final TagRepository tagRepository;

    public TagService(TagRepository tagRepository){
        this.tagRepository = tagRepository;
    }

    public List<Tag> getAllTags(){
        return tagRepository.findAll(Sort.by("name"));
    }

    public Set<Tag> getTagsByIds(Set<UUID> tagIds) {
        if (tagIds == null || tagIds.isEmpty()) {
            return new HashSet<>();
        }

        Set<Tag> tags = new HashSet<>(tagRepository.findAllById(tagIds));

        if (tags.size() != tagIds.size()) {
            throw new IllegalArgumentException("One or more tags do not exist.");
        }

        return tags;
    }
}
