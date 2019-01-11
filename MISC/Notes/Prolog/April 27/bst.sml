datatype 'a BST = emptytree
				| binnode of 'a * 'a BST *  'a BST

fun insert item emptytree = binnode(item, emptytree, emptytree) | insert item (binnode(item2, left, right)) = if item > item2 then (binnode(item2, left,  (insert item right))) else (binnode(item2, insert item left, right))

fun lookup item emptytree = false | lookup item (binnode(item2, left, right)) = if item > item2 then (lookup item right) else if item < item2 then (lookup item left) else true
