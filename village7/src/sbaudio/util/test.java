package sbaudio.util;

import java.io.File;

public class test {
    public String name="";
    public static void main(String[] args) {
        File file = new File("D:\\TSBrowserDownloads");
        File[] files = file.listFiles();
        for (File f: files){
            String name = file.getName();
            f.delete();
        }
    }
}
