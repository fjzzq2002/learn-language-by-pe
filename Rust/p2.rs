fn main() {
    let mut v=vec![1,1];
    let mut sum=0;
    loop {
        let u=v[v.len()-1]+v[v.len()-2];
        if u>4000000 {break}
        if u%2==0 {sum+=u;}
        v.push(u);
    }
    println!("{}",sum);
}