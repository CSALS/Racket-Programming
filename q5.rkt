;#lang racket
; https://docs.racket-lang.org/guide/lambda.html
;(lambda rest-id
;  body ...+)
; a lambda expression can have a single rest-id that is not surrounded by parentheses.
; The resulting function accepts any number of arguments,
; and the arguments are put into a list bound to rest-id.


(define makeTree (lambda list list))

#|
(makeTree 1
          (makeTree 2
               (makeTree 6)
               (makeTree 7 (makeTree 8))
          )
          (makeTree 3
               (makeTree 9 (makeTree 10) (makeTree 11))   
           )
          (makeTree 4)
          (makeTree 5)
)
|#