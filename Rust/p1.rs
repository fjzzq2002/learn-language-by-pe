fn main() {
    let mut tot=0;
    for i in 1..1000 {
        if i%3==0||i%5==0 {tot+=i;}
    }
    println!("{}",tot);
}