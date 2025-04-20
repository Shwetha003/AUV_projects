
(cl:in-package :asdf)

(defsystem "bot_simulator-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "botpose" :depends-on ("_package_botpose"))
    (:file "_package_botpose" :depends-on ("_package"))
  ))