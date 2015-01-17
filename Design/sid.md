#SID Algorithm
=======

=======
##What is SID?
=======

SID stands for Semantic Index Distance. It is a way to index cases for retrival of similar cases in a
CBR. SID uses a semantic net and associations between a case and that net to establish what the case is.
When we want to retrieve a case we index the unsolved case according to the semantic net. After this SID
uses a breadth-first search technique to establish a numerical value for how far away a case is. These
numbers are assigned to the case encountered up to some distance from the querying case. That is all SID
does. SID acts on all connections between the querying case and the semantic net so as to both be accurate
and be capable of parallel computation.