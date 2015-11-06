Bookmark Manager

User Stories

As a user
So i can see links from the database
I want the database to show me logged links

As a user
So that I can quickly find web sites I recently bookmarked
I would like to see links in descending chronological order

As a user
So that I can add new links
I want to add links to the database

As a user
So that I can identify a link
I want to be able to tag a link

As a user
So I can search for a specific link
I want to be able to search using tags


Persistence:
	Persistence is “the continuance of an effect after its cause is removed”. In the context of storing data in a computer system, this means that the data survives after the process with which it was created has ended. In other words, for a data store to be considered persistent, it must write to non-volatile storage.

Session persistence:
	Session persistence refers to directing a client’s requests to the same back-end web or application server for the duration of a “session” or the time it takes to complete a task or transaction.

	If a user browses your website for five minutes, she probably fetches information from multiple back-end servers. Not accessing the same server every time can cause problems if the web browser or back-end server tries to improve the web experience by storing information that enables the user’s next action to occur more quickly. In this case, it is important – not to say imperative – that all of the user’s requests are sent to the same server.


Defines CRUD: 

In computer programming, create, read, update and delete.
The acronym CRUD refers to all of the major functions that are implemented in relational database applications.

Defines SQL:

SQL (pronounced "squeal") stands for Structured Query Language. It is the most common language used to communicate with modern databases, and there are a handful of basic commands that you need to know.

CREATE TABLE students (id Serial, name varchar(50));

SELECT * FROM students;

UPDATE students SET name = 'Andy' WHERE name = 'Dan';

DELETE FROM students where name = 'Andy';

---------------

within 'ul#links' do
  expect(page).to have_content('Makers Academy')
end

