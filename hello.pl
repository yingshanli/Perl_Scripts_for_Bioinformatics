#!/usr/local/bin/perl -w

# The Perl Hey program: hello.pl
# A simple program to test that Perl is working on your system


# Prompt the user for his name
print "What is your name? ";

# Remove the newline character at the end
chomp ($name = <STDIN>);

# Print a greeting
print "Hey, $name, nice to meet you!\n";

		