(defsystem "esrap-test"
  :depends-on ("esrap")
  :components ((:module "source"
                        :serial t 
                        :pathname "./"
                        :components ((:file "package")
                                     (:file "futil")
                                     (:file "swtools-parser")
                                     (:file "traceall")
                                     (:file "transcoder")))))
