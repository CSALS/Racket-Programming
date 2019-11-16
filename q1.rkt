(define (sumUpRecursive inputList)
  (if (null? inputList)
      0
      (+ (first inputList) (sumUpRecursive (rest inputList)))
     )
  )

(define (sumUpTailRecursion inputList listSum)
  (if (null? inputList)
      listSum
      (sumUpTailRecursion (rest inputList) (+ (first inputList) listSum))
      )
  )