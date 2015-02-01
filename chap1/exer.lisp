
(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))
	)
)

(display (gcd 4 5))
(newline)
/bin/bash: k: command not found
