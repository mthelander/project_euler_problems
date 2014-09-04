; https://projecteuler.net/problem=14
;
; Find the starting number for the longest collatz sequence
; under 1 million.
;

(define (collatz-sequence n)
  (define (iter n count)
    (cond ((eq? n 1) count)
	  ((even? n) (iter (even-case n) (+ count 1)))
	  (else (iter (odd-case n) (+ count 1)))))
  (iter n 0))

(define (even-case n)
  (/ n 2))

(define (odd-case n)
  (+ (* 3 n) 1))

(define (find-longest-collatz-sequence start finish)
  (define (find-max-by proc acc proc-acc n)
    (cond ((>= n finish) acc)
	  ((> (proc n) proc-acc)
	   (find-max-by proc n (proc n) (+ n 1)))
	  (else
	   (find-max-by proc acc proc-acc (+ n 1)))))
   (find-max-by collatz-sequence 0 0 start))

(find-longest-collatz-sequence 1 1000000)
