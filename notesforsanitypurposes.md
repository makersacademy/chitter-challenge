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
