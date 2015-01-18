#Semantic Node
=======

=======
##Description
=======

An aggregate data type of Semantic Nodes(subjects) and Semantic Connections(relationships)*

=======
##Data
=======
* name
	* string containing the nodes identifying name

* connections
	* an array of all connections leading from this node to others

* cases
	* an array of cases associated with the particular semantic node

=======
##Methods
=======
* intitalize
	* Description:
		creates a new instance of the SemanticNode class
	* Input:
		* string containing the subject's name
	* Output:
		* creates a new node

* addConnection
	* Description:
		Adds a new connection to the network using two premade subjects
	* Input:
		* a shallow copy of another SemanticNode instance
		* string containing the type of the connection 
	* Output:
		* creates a new connection and returns true if successful

* getConnections
	* Description:
		Retrieves all connections of the instance
	* Input:
		* None
	* Output:
		* All the connections associated with this node

* addCaseAssoc
	* Description:
		Adds a case associtation to the semantic node
	* Input:
		* A shallow copy of a case
	* Output:
		* None

* getAssocCases
	* Description:
		Retrives all associated cases
	* Input:
		None
	* Output:
		An array containing the cases the semantic node is associated with

=======
###Notes
=======
* Connections are described by tuples with the following structure
	* connection type
	* connected to