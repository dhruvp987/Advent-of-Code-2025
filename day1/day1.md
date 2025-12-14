# Day 1 Learnings
I'm a bit late to the party (I'm starting Advent of Code in the middle of December), but now I'm here!

Day 1 starts off pretty easy. All you need is some file I/O, string extraction, and some mathy magic to get the answer.

However, I spent a lot of time learning how to read from a file in Zig. Apparently, in Zig 0.15 (the version I am using), the file reader and writer API was overhauled,
so a lot of the documentation out there was out of date! In Zig, you create a file reader wrapper, then extract its interface, which you then use. After scouring 
through forums, searching through the standard library documentation, and consulting a good ol local Zig expert, I was finally reading lines from a file! 

After figuring out the interface situation, the API itself is simple to use. You can use a function to read up to a delimiter, such as "\n" for reading lines. Very easy!

One of the things about Zig I quickly liked were the capture groups. You can quickly extract a value from an error union using a simple "try" keyword, and easily 
capture that value in a variable when using loops. It makes error handling very concise and convenient, while still giving you the flexibility to handle each and 
every error the way you like, as opposed to the exception handling system you see in languages like Java or Python. It's definitely more concise than the 
"if (err != nil) return err" fun that you have with Go (although Go is still a great language for how simple and fast it is).

Solving Day 1 was basically an introduction to Zig syntax for me, and it has me liking it so far.
