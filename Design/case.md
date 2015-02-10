#Case
=======

=======
##Description
=======

A data type which is used to hold and describe the plot of a 80's action movie

=======
##Data
=======

* details
	A hash that contains the info for case similarity
	* hero
		A hash describing the hero in the film
	* villain
		A hash describing the villain in the film
	* world
		A hash descrbing the world
* solution
	A hash descrbing the villans defeat
* semanticNet
	A shallow copy of the semantic net being used by all cases

=======
###Hash Details
=======

<!-- Note this is a hash with indifferent access -->

* Hero
	* goal
	* involved-with
	* job
	* actor
	* weapon
* Villain
	* weapon
	* goal
* World
	* type
* Solution
	* lethal
	* weapon
	* dificulty
	* help

=======
##Methods
=======

* set<Var>
	* Input:
		A hash detailing all improtant aspects of <var>
	* Output:
		None
	* Description:
		Sets <var> to the arguement given and makes node in the semantic net if no node currently exists
* initialize
	* Input:
		The semantic net that is to be used with the case
	* Output:
		None
	* Description:
		Sets up the case