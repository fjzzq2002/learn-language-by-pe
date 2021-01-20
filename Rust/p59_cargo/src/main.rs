use std::fs;
use std::collections::*;
fn main() {
    let cipher=fs::read_to_string("p059_cipher.txt").expect("cannot open cipher");
    let cipher: Vec<&str>=cipher.split(',').collect();
    let cipher: Vec<i32>=cipher.into_iter().map(|x| x.parse/*::<i32>*/().expect("not a number!")).collect();
    let words=fs::read_to_string("words_alpha.txt").expect("cannot open wordlist");
    let words=words.lines();
    let mut wordset=HashSet::new();
    for word in words {
        wordset.insert(word);
    }
    println!("# of words: {}",wordset.len());
    let mut max_hit=-1;
    let mut dec: String="".to_string();
    for k0 in 'a'..'z' {
        for k1 in 'a'..'z' {
            for k2 in 'a'..'z' {
                let keys: [i32;3] = [k0 as i32,k1 as i32,k2 as i32];
                let cipher2=&cipher;
                let mut ascii=true;
                for (x,y) in cipher2.into_iter().enumerate() {
                    let z=*y^keys[x%3];
                    if z<0||z>=256 {
                        ascii=false;
                    }
                }
                if !ascii {continue;}
                let cipher2: String=cipher2.into_iter().enumerate().map(|(x,y)| (y^keys[x%3]) as u8 as char).collect();
                let cipher3: Vec<&str>=cipher2.split(' ').collect();
                let mut num_hit=0;
                for s in cipher3 {
                    if let Some(_)=wordset.get(s) {num_hit+=1;}
                }
                if num_hit>max_hit {
                    max_hit=num_hit;
                    dec=cipher2;
                }
            }
        }
    }
    println!("max hit: {}",max_hit);
    println!("decrypted: {}",dec);
    let mut sum=0;
    for s in dec.chars() {
        sum+=s as u32;
    }
    println!("∑ of ascii: {}",sum);
}
