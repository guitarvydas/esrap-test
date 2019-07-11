To see the problem:

start sbcl
(load "load")

The call to (@main) in load.lisp will run esrap and signal an error on "compoundStatement".

The call to (traceall) should cause a trace of all syntax rules used.

The test file is src.p.  It appears to contain a valid Pascal compound statement.

