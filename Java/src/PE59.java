import java.io.*;
import java.util.*;

public class PE59 {
    public static void main(String[] args) {
        Set<String> words=new TreeSet<String>();
        try {
            BufferedReader br=new BufferedReader(new FileReader("words_alpha.txt"));
            String l; while((l=br.readLine())!=null) words.add(l);
        } catch(Exception e) {e.printStackTrace();}
        System.out.println("# of words: "+words.size());
        ArrayList<Integer> chars=new ArrayList<Integer>();
        try {
            BufferedReader br=new BufferedReader(new FileReader("p059_cipher.txt"));
            String[] l=br.readLine().split(",");
            for(String s:l) chars.add(Integer.parseInt(s));
        } catch(Exception e) {e.printStackTrace();}
        System.out.println("# of chars: "+chars.size());
        int[] arr=new int[3];
        int max_tot=-1; String out_str=null;
        for(arr[0]='a';arr[0]<='z';++arr[0])
            for(arr[1]='a';arr[1]<='z';++arr[1])
                for(arr[2]='a';arr[2]<='z';++arr[2]) {
                    StringBuilder dec=new StringBuilder();
                    for(int u=0;u<chars.size();++u) dec.append((char)(chars.get(u)^arr[u%3]));
                    String[] decs=dec.toString().split(" ");
                    int tot=0;
                    for(String w:decs) if(words.contains(w)) ++tot;
                    if(tot>max_tot) {max_tot=tot; out_str=dec.toString();}
                }
        System.out.println("max # of words: "+max_tot);
        System.out.println("plain text: "+out_str);
        int sum_ascii=0;
        for(char u:out_str.toCharArray()) sum_ascii+=u;
        System.out.println("sum of ascii: "+sum_ascii);
    }
}
