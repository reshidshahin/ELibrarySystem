package com.elibrarysystem.util;

/**
 * This class contains utility methods related to String Operations.
 * 
 */
public class StringUtil {
    public static String toCommaSeparatedString(Object[] items){
        StringBuilder sb = new StringBuilder();
        for (Object item : items) {
            sb.append(item).append(",");
        }
        if(sb.length()>0){ //last elementden sonrada comma gelecek onu remove elemek ucun bu if'i yaziriq.
            sb.deleteCharAt(sb.length()-1);
        }
        return sb.toString();
    }
}
