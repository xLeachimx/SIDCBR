# SIDCBR
A case based reasoner that tests a new technique I call Semantic Index Distance to index cases


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

=======
##Signal
=======

Signals have a type which is defined as the relation between the case that is sending the signal and the
node where the signal originates.

When comparing cases a signal is sent out along each connection that the querying case has. These signals
start with an initial strength s and each connection they follow reduces that strength. This means that no
matter where the signal originates it will only reach a local area as defined by s. With that being said
this area is not directly related to the number of connections. The strength of each connection is determined
by the connection type. The type strength determines how the signal degrades and therefore the travel distance
of the signal.

Signals end when either their strength is <= 0. When they interact with a node which is associated with a case,
and assuming this association is the same as the signal type, the signal registers with the case and then continues
on its way. After such an interaction the case itself rejects and signals which are weaker then the one recieved for
the specific relationship between the case and the node in question. This means that the maximal similarity is ensured
when comparing cases.


=======
##Signal Processing
=======

After every signal dies out and each case has been excited then the difference calculation begins. Each case handles the
calculation by themselves, again as a nice parallel caveat. After each of the cases in memeory computes the average
activation for the case in general these numbers are used to determine the overall similarity to the querying case for
the sake of computing a new solution. For reference these averages can be weighted so as to put priority for certain
aspects of each case.