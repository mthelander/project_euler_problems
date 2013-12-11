;; Project Euler #20
;; http://projecteuler.net/problem=20

;; n! means n × (n − 1) × ... × 3 × 2 × 1
;;
;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
;;
;; Find the sum of the digits in the number 100!

(define (sum-digits n)
  (if (< n 1) 0
      (+ (modulo n 10) (sum-digits (floor (/ n 10))))))

(define (factorial n)
  (if (= n 1) 1
    (* n (factorial (- n 1)))))

(sum-digits (factorial 100))
