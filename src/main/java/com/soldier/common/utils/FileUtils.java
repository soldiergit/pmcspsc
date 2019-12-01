package com.soldier.common.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @ProjectName:pmcspsc
 * @author:soldier
 * @Email:583403411@qq.com
 * @create:19-12-1下午4:49
 * @Describe:
 **/
public class FileUtils {
    public static String upLoad (String UPLOAD_FILES_PATH, String fileName, MultipartFile file) throws IOException {
        if(file.isEmpty()){
            return "文件为空";
        }else{
            File dest = new File(UPLOAD_FILES_PATH  + "/" +  fileName );
            //判断文件父目录是否存在
            if(!dest.getParentFile().exists()){
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
        }
        return "true";
    }

    public static void download(final HttpServletResponse response, String realPath) {
        File file = new File(realPath);
        if (file.exists()) {
            response.setHeader("content-type", "application/octet-stream");
            response.setContentType("application/octet-stream");
            // 实现文件下载
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
