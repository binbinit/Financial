package com.ww.srb.oss.service;

import java.io.InputStream;

/**
 * @Author: ww
 * @DateTime: 2022/8/8 11:11
 * @Description: This is description of class
 */
public interface FileService {

    // 上传阿里云
    String upload(InputStream inputStream, String module, String fileName);

    // 根据url删除文件
    void removeFile(String url);
}
