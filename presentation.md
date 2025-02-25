---
title: Building the Future of the Terminal with Rust
sub_title: RustMeet 2025
author: Orhun Parmaksız
theme:
  path: config/theme.yml
---

<!-- column_layout: [4, 5] -->

<!-- column: 0 -->

<!-- new_lines: 1 -->

![](assets/orhun.jpg)

<!-- column: 1 -->

<!-- pause -->

<!-- new_lines: 1 -->

### **Orhun Parmaksız**

🦀 Open source, Rust and terminals!

🐭 **Ratatui**, **Ratzilla**, **git-cliff**, **binsider**

📦 **Arch Linux** (btw)

---

`https://orhun.dev             `

`https://github.com/orhun      `

`https://youtube.com/@orhundev `

<!-- end_slide -->

<!-- new_lines: 3 -->

<!-- column_layout: [5, 4] -->

<!-- column: 1 -->

![](assets/thinker.gif)

<!-- column: 0 -->

# Goals

1. Familiarize you with the terminal
2. Showcase the power of Rust in the terminal
3. Equip you with the modern libraries/tools
4. Inspire you to build stuff™ ✨

<!-- end_slide -->

<!-- column_layout: [2, 2, 4, 2] -->

<!-- column: 1 -->

<!-- jump_to_middle -->

**THE TERMINAL █**

<!-- column: 2 -->

<!-- new_lines: 6 -->

![image:width:100%](assets/computer1.gif)

<!-- end_slide -->

![image:width:90%](assets/cursor.gif)

<!-- pause -->

```sh +exec
rio
```

<!-- end_slide -->

### It's 2025, why still terminal?

<!-- pause -->

---

<!-- column_layout: [3, 2] -->

<!-- column: 1 -->

<!-- new_lines: 2-->

![image:width:80%](assets/computer2.gif)

<!-- column: 0 -->

#### Timelessness

- Works the same across decades

<!-- pause -->

#### Powerful

- Your workflow, your rules
- Scripting & automation
- Endless possibilities

<!-- pause -->

#### Efficient

- Low power usage
- Runs on a potato

<!-- pause -->

<!-- reset_layout -->

<!-- column_layout: [1, 10] -->

<!-- column: 1 -->

> "Make the machine do exactly what you want with minimal friction"

<!-- end_slide -->

## "I want to download MP3 from YouTube"

<!-- new_lines: 1 -->

<!-- column_layout: [1, 1] -->

<!-- column: 0 -->

<!-- pause -->

![image:width:100%](assets/computer_vapor.gif)

<!-- column: 1 -->

<!-- new_lines: 6 -->

<!-- pause -->

```bash
$ yt-dlp -f bestaudio
  --extract-audio
  --audio-format mp3
  --audio-quality 0
```

<!-- end_slide -->

## "I want to monitor my network traffic"

<!-- new_lines: 1 -->

<!-- column_layout: [1, 1] -->

<!-- column: 0 -->

<!-- pause -->

![image:width:100%](assets/computer_vapor2.gif)

<!-- column: 1 -->

<!-- new_lines: 6 -->

<!-- pause -->

```sh +exec +acquire_terminal
sudo oryx
```

<!-- end_slide -->

<!-- jump_to_middle -->

Terminal is the past, present and future. █

<!-- end_slide -->

<!-- column_layout: [2, 2, 4, 2] -->

<!-- column: 1 -->

<!-- jump_to_middle -->

**RUST IN THE TERMINAL █**

<!-- column: 2 -->

<!-- new_lines: 6 -->

![image:width:80%](assets/crab.gif)

<!-- end_slide -->

<!-- new_lines: 2 -->

![image:width:30%](assets/pills.gif)

<!-- jump_to_middle-->

<!-- new_lines: 5 -->

<!-- column_layout: [1, 2] -->

<!-- column: 1 -->

1. **Performance** ⚡
2. **Safety** 🛡️
3. **Ecosystem** 📦

<!-- end_slide -->

## Performance

<!-- pause -->

```
  rust-hyper ran
    1.01 ± 0.02 times faster than rust-reqwest
    1.24 ± 0.06 times faster than go-http-client
    2.03 ± 0.05 times faster than zig-http-client
    4.26 ± 0.12 times faster than curl
    8.57 ± 0.12 times faster than python-http-client
   19.93 ± 0.25 times faster than cpp-asio-httpclient
```

<!-- column_layout: [1, 3] -->

<!-- column: 1 -->

[](https://github.com/orhun/zig-http-benchmarks)

<!-- reset_layout -->

![](assets/car.gif)

<!-- end_slide -->

## Safety

<!-- pause -->

<!-- column_layout: [4, 6] -->

<!-- column: 0-->

![image:width:100%](assets/meme1.jpg)

<!-- column: 1 -->

<!-- pause -->

![image:width:100%](assets/bumblebee.png)

> https://github.com/MrMEEE/bumblebee-Old-and-abbandoned/issues/123

<!-- end_slide -->

<!-- new_lines: 3 -->

```rust
use std::fs;

fn main() -> std::io::Result<()> {
    fs::remove_dir_all("/usr /lib/nvidia-current/xorg")?;
    Ok(())
}
```

<!-- pause -->

```
Error: Os { code: 2, kind: NotFound, message: "No such file or directory" }
```

<!-- end_slide -->

![image:width:90%](assets/errors1.jpg)

<!-- end_slide -->

![image:width:90%](assets/errors2.jpg)

<!-- end_slide -->

## Ecosystem

<!-- pause -->

![image:width:26%](assets/crate.gif)

rustc, rustup, clippy, rust-analyzer, rustlings, rustfmt, rust-bindgen, cargo

<!-- pause -->

cargo-about, cargo-audit, cargo-binstall, cargo-bloat, cargo-clone, cargo-crev, cargo-deb, cargo-deny, cargo-depgraph, cargo-dist, cargo-edit, cargo-expand, cargo-generate, cargo-generate-rpm, cargo-hack, cargo-insta, cargo-llvm-cov, cargo-machete, cargo-make, cargo-modules, cargo-msrv, cargo-nextest, cargo-outdated, cargo-public-api, cargo-semver-checks...

<!-- end_slide -->

## Libraries

> https://lib.rs/command-line-interface

<!-- pause -->

### clap: _Command Line Argument Parser_

```rust
use clap::Parser;

/// Simple program to greet a person
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// Name of the person to greet
    #[arg(short, long)]
    name: String,

    /// Number of times to greet
    #[arg(short, long, default_value_t = 1)]
    count: u8,
}
```

<!-- end_slide -->

```sh +exec +acquire_terminal
unbuffer git cliff -h | less -R
```

![image:width:90%](assets/liquid.gif)

<!-- end_slide -->

### colored: _Colorize your terminal output_

<!-- pause -->

```bash
echo -e "\033[34mthis is blue\033[0m"
```

<!-- pause -->

```rust
use colored::Colorize;

"this is blue".blue();

"this is red".red();

"this is red on blue".red().on_blue();

"you can also make bold comments".bold();

println!("{} {} {}", "or use".cyan(), "any".italic().yellow(), "string type".cyan());
```

<!-- end_slide -->

### duct: Library for running child processes

<!-- pause -->

```rust
use duct::cmd;
use std::io::prelude::*;
use std::io::BufReader;

// Merge standard error into standard output
// and read both incrementally
let out = cmd!("bash", "-c", "echo out && echo err 1>&2");

let reader = out.stderr_to_stdout().reader()?;
let mut lines = BufReader::new(reader).lines();

assert_eq!(lines.next().unwrap()?, "out");
assert_eq!(lines.next().unwrap()?, "err");
```

🔒 No risk of deadlocks and no risk of leaking zombie children processes 🧟

<!-- column_layout: [2, 1] -->

<!-- column: 1-->

<!-- pause -->

## And many more...

<!-- end_slide -->

## Ratatui

R in Rust stands for Ratatui

### How to

### Templates

### Apps

### Ratzilla

![image:width:80%](assets/lets-surf.gif)

### Elm

## Future

7 tools

## Zellij

## Starship

## Atuin

## Nushell

## More

### The Future

Ecosystem gaps that need to be filled
Dream terminal tools that don’t exist yet
How to contribute and grow the Rust CLI/TUI ecosystem
Resources for getting started
Encouraging open-source contributions
Final thoughts

## Q & A

```

```
