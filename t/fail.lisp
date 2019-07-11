(in-package :cl-user)

(prove:plan 1)

(prove:ok
 (progn 
   (traceall)
   (@main)))

(prove:finalize)


