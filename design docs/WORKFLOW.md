Diagram - break down user story and functionality requirments- initially from user perspective. 
Diagram - engineer approach to include requests /response systems diagrams.
outline requirements and a framework.

mk dir - integration/integration_app.spec and populate with Application class basic code
 create and  populate database_connection.rb
 update spec_helper - DatabaseConnection.connect('chitter_chatter_test')
 create and populate config.ru

 ensure gems required installed  : pg gem, 
 to inc: latest versions ruby gem, install bundler, sinatra

 -run Sinatra with rackup from iterm2 Terminal - refresh and leave to run in background.

 create database in Table plus - preperation for tables to be created and populated. ( can be done via psql -h 127.0.0.1 from terminal )

Tables design recipe
note that identifying tables & columns may require changes as prog is developed. First generation(early commits) will include simplified tables that do not yet contain bcrypt formatting.
*****UPDATE WILL BE REQUIRED TO ENSURE SECURITY***********

password:  to be investigaged. current usage varchar which can be updated.
("text" or "varchar". However, it's recommended to use the "bytea" data type to store binary data, such as the result of a bcrypt hash.)

Tables  created from table plus- with foreign key on makers(User)table to be called from peeps table.

git commit -m "Sinatra connected- rackup funcitoning - peeps/makers Tables created. Seeds updated. WORKFLOW progress updated"

unit peep and maker class created
git commit -m "addition of peep and maker class"

