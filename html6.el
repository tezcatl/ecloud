;;; (require 'url)

(defconst HTML5 "\n<!DOCTYPE html>\n")

(defvar html6/alias-list
'((document body) (page-title title) (title h1) (subtitle h2) (bloq div) (para p))
"Here you customize your aliases")

(defun oh-assocref (key alist)
"Gets the item bound to the list "
(let ((item (cdr (assoc key alist))))
  (if (eq nil (cdr item)) (car item)
item)))

(defun html6/get-tag (alias)
"Returns the tag bound to input alias."
(let ((alias
       ((lambda (x)
	  (if (symbolp x) x 
	    (make-symbol (if (stringp x) x 
			   (format "%s" x)))
	    )) alias)))
  (or (oh-assocref alias html6/alias-list) alias)))


(defun list-to-string (&optional list$)
"If list, turns it a string, else leave untouched."
(cond ((stringp list$) list$)
      ((eq () list$) "")
      ((listp list$)
       (progn
	 (setq it-str (format "%s" list$))
	 (let ((it-size (length it-str)))
	   (substring it-str 1 (1- it-size)))))
      )
)

(defun $ (tagspec &optional first-child &rest nodes)
  "Generic definition for basic markup with alias support"
  (let ((tag (or (html6/get-tag tagspec) tagspec))
	(content (concat first-child 
		   (list-to-string nodes))))
    (format "<%s>%s</%s>" tag content tag)))

(defun html (&rest treenodes)
"Renders the page"
(progn
  (princ HTML5)
  (princ "<html>")
  (princ (list-to-string treenodes))
  (princ "</html>\n<!-- created with Emacs Lisp -->\n")
  )
)

(provide 'html6)