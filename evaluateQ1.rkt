#lang racket
(require racket/trace)
(include "q1.rkt")
(trace sumUpRecursive)
(sumUpRecursive '(3 4 5 -1))
(newline)
(trace sumUpTailRecursion)
(sumUpTailRecursion '(3 4 5 -1) 0)