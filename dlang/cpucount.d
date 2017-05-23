// https://dlang.org/phobos/std_parallelism.html#.totalCPUs
import std.parallelism : totalCPUs;
import std.stdio;

void main()
{
    writeln(totalCPUs);
}
