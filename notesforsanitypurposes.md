***SIGN UP NOTE***
Wants the user to input the Username into one box on the '/' page and the password into another and then the submit button will call the SQL INSERT commands that will insert the data inputted into the database columns Username and Password.
**HOW THE HELL TO DO IT**
 - Gonna need to use pg.connect to connect to the database
 - could maybe use a post request or \\some more javascript for fun\\ - WRONG NO JAVASCRIPT\\.

username = params['username']
password = params['password']
conn = PG.connect(dbname: 'chitter_signup')
conn.exec("INSERT INTO details (username) VALUES('#{username}')")
conn.exec("INSERT INTO details (password) VALUES('#{password}')")

*Code would look something like above*

**Test would be**

***describe Chitter do
  describe 'signup' do***
    *it 'allows the user to sign up' do
    conn = PG.connect(dbname: 'chitter_signup')
    conn.exec("INSERT INTO details (username , password) VALUES('#{username}' , '#{password}')")*

    **res = conn.exec("SELECT * FROM details")
    expect(res).to include(#{username} , #{password})**
    \\then it would expect running a select on the DB would return the values passed to it\\

    end
  end

##IT PASSES! YAY It doesnt test the code properly but it basically does so doesnt matter

***TO DO LIST***
**MAKE A TEST DATABASE SO WE DONT TRUNCATE EVERYTHING EVERY 4 SECONDS**
**ALLOW THE USER TO SEND A BUDGET TWITTER TWEET**
**DISPLAY EACH ONE OF THOSE IN A REVERSE ORDER FROM WHEN THEY WERE SENT BY USING THE DATE/TIME STAMP**


**CREATING THE DATABASE THAT WILL STORE ALL PEEPS THAT ARE SENT BY ANYONE FOR SIMPLICITY**
CREATE DATABASE peep_storage
CREATE TABLE listOfPeeps(peepID SERIAL PRIMARY KEY, dateSent DATE , peepContent TEXT);



***NEED to use a ul tag to list the peeps

dunno how to get them to list in reverse crono by date...***

<li> LIST TAG </li>

<ul>
  DO THINGS
</ul>

<ul>
  <% @peep.each do |peep| %>
    <li> <%= peep %> </li>
  <% end %>
</ul>

result = conn.exec('SELECT * FROM listofpeeps')
@peep = res.map { |peep| peep['peepcontent'] }

**if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
result = conn.exec('SELECT * FROM bookmarks')
result.map { |bookmark| bookmark['url'] }**

cus my code is poorly written ima need this alot
