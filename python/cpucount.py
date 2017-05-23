import os

# https://docs.python.org/3.6/library/os.html#os.cpu_count
print(os.cpu_count())
print(len(os.sched_getaffinity(0)))
