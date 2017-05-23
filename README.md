# cpucount

* My environment.

```console
$ uname -smrv
Linux 4.4.0-72-generic #93-Ubuntu SMP Fri Mar 31 14:07:41 UTC 2017 x86_64
$ cat /proc/cpuinfo| grep ^processor| wc -l
4
```

### nproc(1)

```console
$ nproc --version| head -1
nproc (GNU coreutils) 8.25
$ nproc
4
$ taskset -c 0,1 nproc
2
```

### Python

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

### Ruby (parallel gem)

```console
$ ruby --version
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
$ ruby ruby/cpucount.rb
4
$ taskset -c 0,1 ruby ruby/cpucount.rb
4
```

### Go

```console
$ go version
go version go1.6.2 linux/amd64
$ go run golang/cpucount.go
4
$ taskset -c 0,1 go run golang/cpucount.go
2
```

### D

```console
$ dmd --version
DMD64 D Compiler v2.074.0
Copyright (c) 1999-2017 by Digital Mars written by Walter Bright
$ rdmd dlang/cpucount.d
4
$ taskset -c 0,1 rdmd dlang/cpucount.d
4
```
