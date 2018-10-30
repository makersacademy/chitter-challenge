require 'pg'

#Class to handle interactions and requests with the database
class Database
  #Connect to Database on Initialize
  def initialize
    @db = PG.connect(dbname: 'MasterDatabase')
  end
  #Returns true or false if the login creds are correct
  def verifyLogin(useremail, password)
    userData = getuserdata(useremail)
    if userData["userpass"] == password
      true
    else
      false
    end
  end
  #Adds a new user to the database as long as the details are not already in use
  def createUser(username, userhandle, useremail, userpass)
    if NewUserAvaliable(useremail, userhandle)
      @db.exec("INSERT INTO Users (UserName, UserHandle, UserEmail, UserPass) VALUES('#{username}', '#{userhandle}', '#{useremail}', '#{userpass}')")
      true
    else
      'USERERROR-CREDENTIALSTAKEN'
    end
  end
  #Remove an exsisting user from the database cleanly so their id can be take
  def RemoveUser()
  end


  private
  
  #Gets the data about a specific user using their email
  def getuserdata(userEmail) 
    userData = @db.exec("SELECT * FROM Users WHERE UserEmail='#{userEmail}'")
    if userData.num_tuples.zero?
      'USERERROR-DOESNOTEXIST'
    else
      userData[0]
    end
  end
  #returns true of the user handle is avaliable and handle is not in use
  def NewUserAvaliable(useremail, userhandle)
    result = @db.exec("SELECT * FROM Users WHERE UserEmail='#{useremail}' OR UserHandle='#{userhandle}'")
    if result.num_tuples.zero?
      true
    else
      false
    end
  end
end

