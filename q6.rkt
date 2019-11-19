;#lang racket
; Mutli-line comments :- https://stackoverflow.com/questions/3732173/multiple-lines-comments-in-scheme-rnrs
(include "q5.rkt")

#|
   Each path is printed after function returns to root.
|#
(define (printPathsRecursive tree)
    (for ([eachPath (evalPaths tree)])
        (clean-list eachPath)
    )
)
#|
 This function evaluates all paths from the root node to leaves in "tree"
 Output :- List of all paths where each path is a list of numbers only.
|#
(define (evalPaths tree)
    (if (= (length tree) 1)
        (list tree)
        ;root = first tree   &   children = rest tree
        (appendRootToPaths (childrenPaths (rest tree)) (first tree))
    )
)
#|
 Each child in turn may be root for a sub-tree. So this function calls evalPaths on each child list.
 Output :- Same output as evalPaths.
 This function input is list of children. And each children is in turn a tree so calling evalPaths on each of that children is done by this function.
|#
(define (childrenPaths children)
    (if (null? children)
        children
        (append (evalPaths (first children)) (childrenPaths (rest children)))
    )
)
#|
 Appends current node to top of all paths
 Input :-
       path_from_children = List of all paths. Each path is list of numbers only.
       root_value = The root node value which should be appended in each path.
 Output :- List of paths from root to leaf.
|#
(define (appendRootToPaths paths_from_children root_value)
    (if (null? paths_from_children)
        paths_from_children
        (append (list (append (list root_value) (first paths_from_children))) (appendRootToPaths (rest paths_from_children) root_value))
    )
)

#|
 https://stackoverflow.com/questions/36869976/racket-how-do-i-remove-parentheses-and-apostrophe-from-lists?rq=1
 Removes ' ( ) from path which is a list of numbers only.
|#
(define (clean-list path)
  (for ([i path])
    (print i)
    (display #\space)
    )
  (newline)
)

; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#|
   Each path is printed after function reaches the leaf node.
|#

(define (printPathsTailRecursive tree)
   (helper tree '())
)

#|
  Since we need to print path when function reaches leaf node we are using helper function which takes two arguments tree and path. We store the path in the path variable.
|#

(define (helper tree path)
    (if (= (length tree) 1)
       (clean-list (append path (list (first tree))))
        (for ([child (rest tree)])
            (helper child (append path (list (first tree))))
        )
    )
)
#|
(printPathsRecursive
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
) (newline)


(printPathsTailRecursive
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
)
|#