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

####

Current usage:

(ql:quickload :swtools-parser)
(@create-swtools-parser 
	  :peg-input-filename 
	  (asdf:system-relative-pathname
		:swtools-parser
		"swtools-parser.peg")
	  :output-lisp-filename 
	  (asdf:system-relative-pathname
		:swtools-parser
	  	"swtools-parser.lisp"))
(ql:quickload :esrap-test)
(ql:quickload :prove)
(prove:run (asdf:system-relative-pathname :esrap-test "t/run.lisp"))

####


See build.drawio (using draw.io editor) or build.svg for the final intended flow.

We load a bunch of lisp files to create @create-pascal-parser.

We create "swtools-parser.lisp" using @create-pascal-parser (which reads swtools-parser.peg and writes swtools-parser.lisp).

Then, we load "swtools-parser.lisp" plus a bunch of lisp to create @main.

We build software-tools-in-cl.lisp using @main (which reads src.p).

In "make", I would write a rule for %.peg:%.lisp, which would be more general than the above.  The general rule would be called and would convert input <filename>.peg into <filename>.lisp.

(This would also describe the conversion of "peg.peg" to "peg.lisp", which I don't bother with here.  I created peg.lisp and simply use it here.  Likewise, I could take swtools-parser.lisp as a given.  I'm still debugging swtools-parser.lisp, so my workflow includes generating it, then using it).

In the final run, src.p will contain the full software tools in Pascal source code.  Now, it only contains a small snippet of test code.

Final, final version:

Step 1 is to debug the grammar in swtools-parser.peg (-> swtools-parser.lisp).  We need to debug the grammar, because we borrowed it from ANTLR.  Some phrases in the grammar might not be compatible with PEG (aka ESRAP).  We might want to, also, reformat the grammar to make it easier to emit CL.  I don't know yet, time will tell.

Step 2 is to add Lisp to the grammar in swtools-parser.peg.  This will generate sequences of Lisp code that mimic the actions of the given Pascal code.  Thus, we will have a .lisp file that contains a Lisp version of all of the software tools code (less the non-portable stuff).  (You can see the beginnings of such addeded code in the "# boilerplate" section which calls lisp's (values) to generate nothingness).  We will use ESRAP short-hand (e.g. :lambda) to tack code into the parser.  N.B. I don't need to generalize, I will stop tweaking swtools-parser.peg when it successfully recognizes the software tools source code.  I will not continue to build a generalized Pascal parser (although this could be done).  No one uses Pascal these days, so this project stops after we have dragged the Software Tools sources into the future.  N.B. after getting this running in Lisp, we could easily modify the code snippets in swtools-parser.peg to emit JS or Java or Python, etc.  We are simply creating a text-to-text transpiler using PEG (and ESRAP).

