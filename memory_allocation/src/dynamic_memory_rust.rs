use std::time::Instant;

struct Node {
    data: i32,
    next: Option<Box<Node>>,
}

impl Drop for Node {
    fn drop(&mut self) {
        let mut current = self.next.take(); 
        while let Some(mut boxed_node) = current {
            current = boxed_node.next.take(); 
        }
    }
}

fn main() {
    let start = Instant::now();
    let mut head = Box::new(Node { data: 0, next: None });
    let mut tail = &mut head;
    for i in 0..50000 {
        let node = Box::new(Node { data: i, next: None });
        tail.next = Some(node);
        tail = tail.next.as_mut().unwrap();
    }
    println!("{:?}", start.elapsed().as_nanos());
}
