package org.fridge.controller;

import org.fridge.model.Tag;
import org.fridge.model.common.ApiResponse;
import org.fridge.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TagController {
    TagService tagService;

    @Autowired
    public void setTagService(TagService tagService) {
        this.tagService = tagService;
    }

    @PostMapping(path = "/tag/insert")
    public ApiResponse<Object> insert(String describe) {
        return tagService.insert(new Tag(describe));
    }

    @PostMapping(path = "/tag/all")
    public ApiResponse<List<Tag>> selectAll() {
        return tagService.selectAll();
    }

    @PostMapping(path = "/tag/delete")
    public ApiResponse<Object> delete(String info) {
        return tagService.delete(info);
    }
}
