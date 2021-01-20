use std::cmp::*;

fn main() {
    let mut ans=0;
    for a in 100..999 {
        for b in 100..999 {
            let c=a*b;
            let cs=c.to_string();
            let rcs: String=cs.chars().rev().collect();
            if cs==rcs {
                ans=max(ans,c);
            }
        }
    }
    println!("{}",ans);
}
