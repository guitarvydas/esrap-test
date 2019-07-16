(defsystem "esrap-test"
  :depends-on ("esrap" "swtools-parser")
  :components ((:module "source"
                        :serial t 
                        :pathname "./"
                        :components ((:file "package")
                                     (:file "futil")
                                     ;; (:file 
				     ;;  (system-relative-pathname 
				     ;;   :swtools-parser
				     ;;   "swtools-parser"))
				     (:file "../swtools-parser/swtools-parser")
                                     (:file "traceall")
                                     (:file "transcoder")))))
