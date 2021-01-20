use std::cmp::max;
fn lpf(mut v: i64) -> i64 {
    let mut u:i64=2;
    let mut ans=1;
    while u*u<=v {
        while v%u==0 {
            v/=u;
            ans=max(ans,u);
        }
        u+=1;
    }
    ans=max(ans,v);
    return ans;
}
fn main() {
    let num=13195;
    println!("lpf of {}: {}",num,lpf(num));
    let num=600851475143;
    println!("lpf of {}: {}",num,lpf(num));
}
