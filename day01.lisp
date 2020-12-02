(defparameter ifile "./day01input.txt")

(defun load-input (path)
  (with-open-file (in path :direction :input)
    (let ((eof (list 'eof)))
      (do* ((line (read in nil eof)
                  (read in nil eof))
            (res (cons line nil)
                 (cons line res)))
        ((eql line eof) (nreverse (cdr res)))))))

(defun 2sum (lst &optional (sum 2020))
  (do* ((mp (make-hash-table))
       (l lst (cdr l))
       (match nil (gethash (car l) mp)))
      ((or match (null l))
       (if match 
           (values match (car l))
           (values -1 -1)))
      (setf (gethash (- sum (car l)) mp) (car l))))

(defun solution (lst)
  (multiple-value-bind (a b) (2sum lst 2020)
    (* a b)))

(print (solution (load-input ifile)))
