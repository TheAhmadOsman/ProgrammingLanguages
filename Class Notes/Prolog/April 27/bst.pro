insert(Item, emptytree, binnode(Item, emptytree, emptytree)).

insert(Item, binnode(Item2, Left, Right), binnode(Item2, Left, NewRight)):- Item > Item2, insert(Item, Right, NewRight).

insert(Item, binnode(Item2, Left, Right), binnode(Item2, Left, NewRight)):- Item < Item2, insert(Item, Right, NewRight).

lookup(Item, binnode(Item, _, _)).

lookup(Item, binnode(Item2, _, R)) :- Item > Item2, lookup(Item, R).

lookup(Item, binnode(Item2, L, _)) :- Item < Item2, lookup(Item, L).

buildTree([], Tree,Tree).
buildTree([H|T], Tree, NTree) :- insert(H, Tree, HTree), buildTree(T, HTree, NTree).
