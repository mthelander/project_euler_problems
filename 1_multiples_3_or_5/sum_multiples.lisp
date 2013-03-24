;;; Project Euler problem #1
;;; http://projecteuler.net/index.php?section=problems&id=1
;;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;; Find the sum of all the multiples of 3 or 5 below 1000.

(defvar *max* 999)

(defun sum-multiples(n)
  (let((x (floor (/ *max* n))))
    (* n (/ (* x (+ 1 x)) 2))))

(format t "~a~%" (+ (sum-multiples 5) (sum-multiples 3) (sum-multiples -15)))
