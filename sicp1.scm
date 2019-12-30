#|
1.1 - The Elements of Programming
|#
; 1.1.2 - Naming and the Environment
(define pi 3.14159)
(define radius 6)
(define circumference (* 2 pi radius))
circumference

; 1.1.4 - Compound Procedures
#|
General form of a procedure definition:
(define (<name> <formal parameters>) <body>)
|#
(define (square x) (* x x))
(square 13)

; 1.1.5 - The Substitution Model for Procedure Application
(define (sum-of-squares x y)
  (+ (square x) (square y))
  )

; 1.1.6 - Conditional Expressions and Predicates
#|
General form of a case analysis:
(cond (<p1> <e1>)
      (<p2> <e2>)
      ...
      (<pn> <en>))
|#
(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))
	)
  )
;OR
(define (abs x)
  (cond ((< x 0) (- x))
	(else x)
	)
  )

#|
Exercise 1.3
Define a procedure that takes three numbers as arguments
and returns the sum of the squares of the two larger numbers.
|#
(define (greater-num x y) (if (> x y) x y))
(define (sum-of-larger-squares x y z)
  (sum-of-squares
   (greater-num x y)             ;returns the larger x or y
   (if (= (greater-num x y) x)   ;if that was x
       (greater-num y z)         ;then compare y and z
       (greater-num x z)         ;else compare x and z
       )
   )
  )
; test some cases
(sum-of-larger-squares 6 12 11)
(sum-of-larger-squares 12 11 6)
(sum-of-larger-squares 11 6 12)
(sum-of-larger-squares 6 5 5)
(sum-of-larger-squares 5 5 5)

|#
Exercise 1.5
With applicative-order evaluation, which is what the 
  interpreter actually uses - "evaluate the arguments
  and then apply", we see the power of a special form
  (like "and" or "or") that does not evaluate all 
  subexpressions if they won't change the outcome of 
  the predicate. In this case, the predicate of the
  special form "if" evaluates to True, returning the 
  consequent without bothering with evaluating the 
  alternative.
With normal-order evaluation, the interpreter performs
  a "fully expand and then reduce" evaluation method.
  When the expression is evaluated, the interpreter 
  will attempt to resolve the definition of p so that
  test can be evaluated, but it will be stuck in an 
  infinite loop.
#|

; 1.1.7 - Example: Square Roots by Newton's Method

