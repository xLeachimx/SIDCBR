#Semantic Net
=======

=======
##Description
=======

An aggregate data type of Semantic Nodes(subjects) and Semantic Connections(relationships)*

=======
##Data
=======
* nodes
	* All nodes that are in the semntic net remain here

* validConnections
	* A list of all valid connection types


=======
##Methods
=======
* addNode
	* Description:
		Adds a new node to the network, no connections are automatically made
	* Input:
		* string containing the subject's name
	* Output:
		* creates a new node and returns true if successful

* addConnection
	* Description:
		Adds a new connection to the network using two premade subjects
	* Input:
		* string containing the name of the subject the connection comes from
		* string containing the name of the subject the connection goes to
		* string containing the name of the connection between the first two arguments 
	* Output:
		* creates a new connection and returns true if successful

* getNode
	* Description:
		Retrieves shallow copy of a specific node for analysis
	* Input:
		* string containing the subject's name
	* Output:
		* A shallow copy of the node spcified by the argument




*Connections are implict to the node data type