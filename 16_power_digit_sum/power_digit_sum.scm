;; Project Euler #16
;; http://projecteuler.net/problem=16

;; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

;; What is the sum of the digits of the number 2^1000?

(define (sum-digits n)
  (if (< n 1) 0
      (+ (modulo n 10) (sum-digits (floor (/ n 10))))))

(sum-digits (expt 2 1000))
