;#lang racket
(define (helper infix operators postfix)
    (if (null? infix)
        (append postfix operators) ;postfix+operators is final postfix expression
        (if (number? (first infix))
            (helper (rest infix) operators (append postfix (list (first infix))))
            (cond 
                ((or (char=? #\+ (first infix)) (char=? #\- (first infix)))
                    (helper (rest infix) (list (first infix)) (append postfix operators))
                )
                (else ;* has more precedence
                    (helper (rest infix) (append (list (first infix)) operators) postfix)
                )
            )
        )
    )
)

(define (infixToPostfix infix)
    (helper infix '() '())
)

;(display (infixToPostfix '(1 #\+ 2 #\* 3 #\* 4 #\- 5))) (newline)