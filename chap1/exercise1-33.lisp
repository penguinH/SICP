
(define (filltered-accumulate a  b) 
	(define (smallest-divisor n) (find-divisor n 2))
	(define (find-divisor n test-divisor)
		(cond ((> (square test-divisor) n) n)
			  ((divides? test-divisor n) test-divisor)
			  (else (find-divisor n (+ test-divisor 1)))
		)
	)
	(define (divides? a b) (= (remainder b a) 0))
	(define (prime? n) (= n (smallest-divisor n)))

	(define (gcd? i) (= 1 (gcd i b)))
	(define (gcd i n) 
		(if (= n 0)
			i	
			(gcd n (remainder i n))
		)
	)
	(define (identify x) x)
	(define (inc x) (+ x 1))
	(define (square x) (* x x))

	(define (accumulate combiner null-value term a next b)
		(define (iter a result)
			(if (> a b)
				result
				(iter (next a) (combiner result (term a)))
			)
		)
		(iter a null-value)
	)
	(define (exer-a) (f-accumulate + 0 square a inc b prime?) )
	(define (exer-b) (f-accumulate * 1 identify 1 inc b gcd?) )

	; exersice1/33
	(define (f-accumulate combiner null-value term a next b filter)
		(cond ((= a b) null-value)
				  ((filter a) (combiner (term a) (f-accumulate combiner null-value term (next a) next b filter)))
				  (else (combiner null-value (f-accumulate combiner null-value term (next a) next b filter)))
		)
	)
	(exer-a)
)
(display (filltered-accumulate 3 7))

