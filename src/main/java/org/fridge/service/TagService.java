package org.fridge.service;

import org.fridge.mapper.TagMapper;
import org.fridge.model.Tag;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagService {
    TagMapper tagMapper;

    @Autowired
    public void setTagMapper(TagMapper tagMapper) {
        this.tagMapper = tagMapper;
    }

    public ApiResponse<Object> insert(Tag tag) {
        int res = tagMapper.insert(tag);
        if (res == 1) {
            return Responses.ok();
        } else {
            return Responses.fail();
        }
    }

    public ApiResponse<List<Tag>> selectAll() {
        return Responses.ok(tagMapper.selectAll());
    }

    public ApiResponse<Object> delete(String info) {
        int result;
        try {
            long id = Long.parseLong(info);
            result = tagMapper.deleteById(id);
        } catch (NumberFormatException e) {
            result = tagMapper.deleteByDescribe(info);
        }
        if (result == 1) {
            return Responses.ok();
        } else {
            return Responses.fail();
        }
    }
}
