;#lang racket

(include "q2.rkt")

(define (evalPostfix postfix stack)
  (if (null? postfix)
      (first stack)
      (cond
        ;if it is number then push it to the stack
        ((number? (first postfix))
           (evalPostfix (rest postfix)
               (append (list(first postfix)) stack)
            )
         )
        ;if it is operator then pop the top 2 operands and use the operator which is in first postfix
         (else
            (evalPostfix (rest postfix)
                      ;rest lst same as cdr lst but works only when lst is not empty
               (append (list(pop (first postfix) stack)) (cdr (cdr stack)))
             )
          )
        )
      )
  )

(define (evaluate operator a b)
    (cond
        ((char=? #\* operator)
            (* a b)
        )
        ((char=? #\+ operator)
            (+ a b)
        )
        (else
            (- a b)
        )
    )
)

(define (pop operator stack)
  (evaluate operator (first (rest stack)) (first stack))
 )
  
(define (evalPostfixExpr postfix)
  (evalPostfix postfix '())
 )

;(display (evalPostfixExpr (infixToPostfix '(1 #\+ 2 #\* 50 #\- 4 #\* 2)))) (newline)