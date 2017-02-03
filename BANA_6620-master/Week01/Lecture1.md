#### Lecture 1 - Introduction to Databases

In general, there are two types of databases.  The most common type of database is a RDBMS - that is Relational Database Management System.  The most popular of these databases include:

1. Oracle Database

2. Microsoft SQL Server

3. PostgresSQL (psql)

4. MySQL

5. Access

For the purposes of this class, we will be using SQL Server, which you are able to download for free through DreamSpark.  

In nearly all work environments, you will be keeping track of data either through a traditional RDBMS, or your company may choose to a NoSQL structure to store data - like MongoDB or CouchDB - though these are less frequent.  We will not be discussing NoSQL environments in this class, but there are a large number of resources available. You can download [MongoDB](https://www.mongodb.com/community) if you would like, and there are many translators that can assist with moving [SQL to Mongo](http://www.querymongo.com/).  Be careful about copying verbatim, but this is a reasonable starting point.

_______

##### ERDs

Before we jump into SQL as a language, we need to understand the paradigm in which we would use SQL.  Note, this class is not aimed to make you capable of being a database administrator; rather, this class is aimed to assist you will all that is necessary to successfully mine an existing database, and understand the basics about how databases are set up, and why they are set up in certain ways.

The main way we express databases is with entity relationship diagrams (ERDs).  An example of an ERD is shown [here](http://www.datanamic.com/support/lt-dez006-what-is-an-erd.html).  In SQL Server or Oracle, you will be able to structure your own structure for tables.  Again, this structure is less enforceable (or just ignored completely) when using psql.  

_______

##### Key Points for Analysts

- RDBMSs are designed to allow us the ability to work with many excel like sheets that are structured clearly in rows and columns in a way where we can combine data from all of them.

- The way that tables are linked is through **foreign key - primary key pairs**, where a primary key is unique for every row in a table, and a foreign key is a potentially repeated version of this primary key in another table.

- In large industry relational databases, companies are careful to assure that all many to many relationships are broken up into two relationships that are both one to many relationships.(I have witnessed smaller companies that do not do this, and it can lead to complications when trying to query  the database).

- Designing a database to be as cost and timely efficient as possible, as well as trouble shoot problems that occur once the database is deployed - an example description of this role can be found [here](http://hiring.monster.com/hr/hr-best-practices/recruiting-hiring-advice/job-descriptions/database-administrator-job-description.aspx).
