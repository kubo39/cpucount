# cpucount

* My environment.

```console
$ uname -smrv
Linux 4.4.0-72-generic #93-Ubuntu SMP Fri Mar 31 14:07:41 UTC 2017 x86_64
$ cat /proc/cpuinfo| grep ^processor| wc -l
4
```

### nproc(1)

- http://man7.org/linux/man-pages/man1/nproc.1.html

```console
$ nproc --version| head -1
nproc (GNU coreutils) 8.25
$ nproc
4
$ taskset -c 0,1 nproc
2
```

### C++14

- http://en.cppreference.com/w/cpp/thread/thread/hardware_concurrency

    number of concurrent threads supported. If the value is not well defined or not computable, returns 0.

```console
$ g++ --version | head -1
g++ (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
$ g++ -std=c++14 cpp/cpucount.cpp
$ ./a.out
4
$ taskset -c 0,1 ./a.out
4
```

### Python

- https://docs.python.org/3.6/library/os.html#os.cpu_count

    Return the number of CPUs in the system. Returns None if undetermined.
    This number is not equivalent to the number of CPUs the current process can use.
    The number of usable CPUs can be obtained with len(os.sched_getaffinity(0))

```console
$ python --version
Python 3.6.1
$ python python/cpucount.py
4
4
$ taskset -c 0,1 python python/cpucount.py
4
2
```

### Ruby

https://ruby-doc.org/stdlib-2.2.0/libdoc/etc/rdoc/Etc.html#method-c-nprocessors

    Returns the number of online processors.
    The result is intended as the number of processes to use all available processors.
    This method is implemented using:
     - sched_getaffinity(): Linux
     - sysconf(_SC_NPROCESSORS_ONLN): GNU/Linux, NetBSD, FreeBSD, OpenBSD, DragonFly BSD, OpenIndiana, Mac OS X, AIX
     The result might be smaller number than physical cpus especially when ruby process is bound to specific cpus.
     This is intended for getting better parallel processing.

```console
$ ruby --version
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
$ ruby ruby/cpucount.rb
4
$ taskset -c 0,1 ruby ruby/cpucount.rb
2
```

### Go

- https://golang.org/pkg/runtime/#NumCPU

    NumCPU returns the number of logical CPUs usable by the current process.
    The set of available CPUs is checked by querying the operating system at process startup.
    Changes to operating system CPU allocation after process startup are not reflected.

```console
$ go version
go version go1.6.2 linux/amd64
$ go run golang/cpucount.go
4
$ taskset -c 0,1 go run golang/cpucount.go
2
```

### Rust

- https://github.com/seanmonstar/num_cpus

    Count the number of CPUs on the current machine.

```console
$ rustc --version
rustc 1.19.0-nightly (5b13bff52 2017-05-23)
$ cargo run -q
4
$ taskset -c 0,1 cargo run -q
4
```

### D

- https://dlang.org/phobos/std_parallelism.html#.totalCPUs

    The total number of CPU cores available on the current machine, as reported by the operating system.

```console
$ dmd --version
DMD64 D Compiler v2.074.0
Copyright (c) 1999-2017 by Digital Mars written by Walter Bright
$ rdmd dlang/cpucount.d
4
$ taskset -c 0,1 rdmd dlang/cpucount.d
4
```

### Nim

- https://nim-lang.org/docs/osproc.html#countProcessors

    returns the numer of the processors/cores the machine has.
    Returns 0 if it cannot be detected.

```console
$ nim --help| head -1
Nim Compiler Version 0.17.0 (2017-05-17) [Linux: amd64]
$ nim c -r nim/cpucount.nim
...
4
$ taskset -c 0,1 nim c -r nim/cpucount.nim
...
4
```
