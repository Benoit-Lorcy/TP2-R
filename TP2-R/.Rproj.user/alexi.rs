fn main() {
    let mut alexi = "alexis".to_string();
    alexi.pop().unwrap();
    let alexis = "alexi";

    println!("{}", alexi == alexis);
}
