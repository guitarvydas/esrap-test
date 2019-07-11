;; 1. load peg.lisp - this is the LISP source code for a PEG parser (based on LISP esrap) 
;; 2. run the parser on sw-toos-in-pascal.peg which generates a LISP source file for a Pascal parser
;;    (not all of pascal, just enough to transcode the sw tools source code (src.p))
;; 3. run the new parser (subset of pascal) on src.p to transcode src.p into some other language

;; This program (@main) performs step 3. (After the code in step 2 has been loaded)

(defun @parse-swtools (&key (swtools-source nil) (result-filename nil))
  (unless (and swtools-source result-filename)
    (error "no sw tools Pascal filename specified"))
  (let ((file-as-string (file-to-string swtools-source)))
    (format *standard-output* "first char is /~A/~%" (char file-as-string 0))
    (let ((transcoded (esrap:parse 'compoundStatement file-as-string)))
      (with-open-file (outf result-filename :direction :output :if-exists :supersede)
        (write transcoded :stream outf)))))

(defun @main()
  "run the parser on src.p"
  (let* ((root (asdf:system-source-directory :esrap-test))
         (swtools-source (merge-pathnames "src.p" root))
         (result (merge-pathnames "src.lisp" root)))
    (@parse-swtools :swtools-source swtools-source
                    :result-filename result)
    (values)))


