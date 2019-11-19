;#lang racket

; Merge Sort -> takes T(N) time
(define (mergesort array)
    (if (= (length array) 1)
        array
        ; Merge takes O(N) time
        (merge
            ; Each of these 2 merge sort takes T(N/2) time
            (mergesort (firstHalf array (quotient (length array) 2)))
            (mergesort (secondHalf array (quotient (length array) 2)))
        )
    )
)
; T(N) = 2*T(N/2) + O(N)  = O(NlogN)

; Returns first half of the array
(define (firstHalf array length)
    (if (zero? length)
        (list)
        (append (list (car array)) (firstHalf (cdr array) (- length 1)))
    )
)

; Returns second half of the array
(define (secondHalf array length)
    (if (zero? length)
        array
        (secondHalf (cdr array) (- length 1))
    )
)

; Merges two sorted sub arrays in O(array length)
(define (merge first second)
    (cond
        ((null? first)
            second
        )
        ((null? second)
            first
        )
        ((< (car first) (car second))
            (append (list (car first)) (merge (cdr first) second))
        )
        (else
            (append (list (car second)) (merge first (cdr second)))
        )
    )
)

;(display (mergesort '(5 1 6 70 3 -2))) (newline)