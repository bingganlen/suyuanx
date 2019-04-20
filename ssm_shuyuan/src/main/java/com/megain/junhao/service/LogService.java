package com.megain.junhao.service;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.LogEntity;
import org.springframework.stereotype.Service;

public interface LogService {
    ServerResponse<String> insertlog(LogEntity log);
}
