(defun @parse-swtools (&key (swtools-source nil) (result-filename nil))
  (unless (and swtools-source result-filename)
    (error "no sw tools Pascal filename specified"))
  (let ((file-as-string (file-to-string swtools-source)))
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
    T))


