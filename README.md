To see the problem:

start sbcl
(load "load")

The call to (@main) in load.lisp will run esrap and signal an error on "compoundStatement".

The call to (traceall) should cause a trace of all syntax rules used.

The test file is src.p.  It appears to contain a valid Pascal compound statement.

## Alternative path using ASDF

1. Ensure that "esrap-test.asd" is findable by ASDF

2. Use PROVE to run the failing test:

    (ql:quickload :esrap-test)
    (ql:quickload :prove)
    (prove:run (asdf:system-relative-pathname :esrap-test "t/run.lisp"))

