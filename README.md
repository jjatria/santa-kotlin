# Santa::Kotlin

This is a sample Perl distribution to illustrate how you might release Perl
code that binds to a shared library written in Kotlin.

The code in here is very limited, but it serves as an illustration of the
a general structure that works, and the hoops that need to be sorted.

This was wirten to accompany a post in the 2023 Perl Advent Calendar blog.

## How to try locally

You can try the code locally by first compiling the shared code:

    cd share
    ./gradlew linkNative

and then running the tests:

    perl -Ilit t/santa-kotlin.t

There should be a way to get this step to run automatically as part of the
build process, but I haven't figured this part out yet.
