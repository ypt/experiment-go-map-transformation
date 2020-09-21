use std::{
    collections::HashMap,
    io::{self, BufRead, Write},
    vec::Vec,
};

fn main() {
    let stdin = io::stdin();
    let mut reader = stdin.lock();
    let stdout = io::stdout();
    let mut writer = stdout.lock();
    let mut buffer = String::new();
    loop {
        buffer.clear();
        let read_result = reader.read_line(&mut buffer);

        // println!("{:?}", buffer);

        match read_result {
            Ok(0) => break,
            Ok(_) => {
                // SETUP
                // -----

                let line_segments: Vec<&str> = buffer.trim_end().split('|').collect();
                let requested_permissions: Vec<&str> = line_segments[0].split(',').collect();

                // println!("{:?}", requested_permissions);

                let mut permissions_by_domain: HashMap<&str, Vec<&str>> = HashMap::new();
                for domain_segment in &line_segments[1..] {
                    let domain_data: Vec<&str> = domain_segment.split(',').collect();
                    let domain_id = domain_data[0];
                    let domain_permissions = (&domain_data[1..]).to_owned();
                    permissions_by_domain.insert(domain_id, domain_permissions);
                }

                // println!("{:?}", permissions_by_domain);

                // WORK
                // ----

                let mut filtered_permissions: HashMap<&str, Vec<&str>> = HashMap::new();
                for (&domain_id, permissions) in &permissions_by_domain {
                    filtered_permissions.insert(domain_id, Vec::new());
                    for permission in permissions {
                        for requested_permission in &requested_permissions {
                            if requested_permission == permission {
                                filtered_permissions
                                    .get_mut(domain_id)
                                    .unwrap()
                                    .push(permission);
                                break;
                            }
                        }
                    }
                }

                // println!("{:?}", filtered_permissions);
            }
            Err(e) => {
                writer.write_all(e.to_string().as_bytes()).ok();
                ()
            }
        };
    }
}
