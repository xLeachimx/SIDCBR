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