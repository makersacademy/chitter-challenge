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
  def CreateUser(username, userhandle, useremail, userpass)
    if NewUserAvailable(useremail, userhandle)
      CreateAUser(username, userhandle, useremail, userpass)
    else
      'USERERROR-CREDENTIALSTAKEN'
    end
  end
  #Remove an exsisting user from the database cleanly so their id can be take
  def RemoveUser(useremail)
    userid = getuserdata(useremail)["userid"]
    RemoveUserData(userid)
    RemoveUserCreds(userid)
  end
  #Public Create a new peep in the database
  def CreatePeep(userhandle, content)
    CreateAPeep(userhandle, content)
  end
  #Public create a new sub peep in the database
  def CreateReplyPeep(mainpeepid, userhandle, content)
    CreateSubPeep(mainpeepid, userhandle, content)
  end
  #Public get a peep data in the database from a specified day
  def GetPeeps(year, month, day)
    result =  GetPeepDataOnDay(year, month, day)
    peeps = Array.new
    result.each do |data|
      peeps.push(data)
    end
    peeps
  end
  #Public get a specific peep
  def GetAPeep(peepid)
    GetSpecificPeep(peepid)
  end
  #Public delete a spefic peep and all subpeeps
  def DeletePeep(peepid)
    RemoveAPeep(peepid)
  end
  #Public gets a user id
  def GetUserID(useremail)
    getuserdata(useremail)["userid"].to_i
  end
  def GetUserHandle(useremail)
    getuserdata(useremail)["userhandle"]
  end
  def GetUserName(useremail)
    getuserdata(useremail)["username"]
  end
  #Public check to see if a user exists
  def DoesUserExist(userid)
    userdata = getuserdataID(userid)
    if userdata.num_tuples.zero?
      false
    else
      true
    end
  end


  private
  
  #Get user id
  def getuserdataID(userid)
    @db.exec("SELECT * FROM Users WHERE UserID='#{userid}'")
  end
  #Creates a new user in the database and returns the new users ID
  def CreateAUser(username, userhandle, useremail, userpass)
    @db.exec("INSERT INTO Users (UserName, UserHandle, UserEmail, UserPass) VALUES('#{username}', '#{userhandle}', '#{useremail}', '#{userpass}')")
    @db.exec("SELECT UserID FROM Users WHERE userhandle='#{userhandle}'")[0]["userid"].to_i
  end
  #Gets all peeps on a specific day
  def GetPeepDataOnDay(year, month, day)
    @db.exec("SELECT * FROM Peeps WHERE DATE (datetime)='#{year}-#{month}-#{day}'")
  end
  #Get a specific peep data
  def GetSpecificPeep(peepid)
    peepData = @db.exec("SELECT * FROM Peeps WHERE PeepID='#{peepid}'")
    if peepData.num_tuples.zero?
      'PEEPERROR-DOESNOTEXIST'
    else
      peepData[0]
    end
  end
  #Gets the data about a specific user using their email
  def getuserdata(userEmail) 
    userData = @db.exec("SELECT * FROM Users WHERE UserEmail='#{userEmail}'")
    if userData.num_tuples.zero?
      'USERERROR-DOESNOTEXIST'
    else
      userData[0]
    end
  end
  #returns true of the user handle is Available and handle is not in use
  def NewUserAvailable(useremail, userhandle)
    result = @db.exec("SELECT * FROM Users WHERE UserEmail='#{useremail}' OR UserHandle='#{userhandle}'")
    if result.num_tuples.zero?
      true
    else
      false
    end
  end
  #Deletes the sub peep and peep data of user id
  def RemoveUserData(userid)
    result = @db.exec("SELECT PeepID FROM Peeps WHERE PeeperID='#{userid}'")
    result.each do |data|
      @db.exec("DELETE FROM SubPeeps WHERE MainPeepID='#{data["peepid"]}'")
    end
    @db.exec("DELETE FROM Peeps WHERE PeeperID='#{userid}'")
  end
  #Deletes user login creds
  def RemoveUserCreds(userid)
    @db.exec("DELETE FROM Users WHERE UserID='#{userid}'")
  end
  #Adds a peep in the database
  def CreateAPeep(userhandle, content)
    @db.exec("INSERT INTO Peeps (PeeperID, PeepContent, datetime) VALUES((SELECT UserID from Users WHERE UserHandle='#{userhandle}'), '#{content}', NOW()) RETURNING PeepID")[0]["peepid"]
  end
  #Adds a sub peep into the database
  def CreateSubPeep(mainpeepid, userhandle, content)
    @db.exec("INSERT INTO SubPeeps (MainPeepID, PeeperID, PeepContent, DateTime) VALUES(#{mainpeepid},(SELECT UserID from Users WHERE UserHandle='#{userhandle}'), '#{content}', NOW())")
  end
  #Removes a peep from the database and all traces of sub peeps
  def RemoveAPeep(peepid)
    @db.exec("DELETE FROM Peeps WHERE PeepID='#{peepid}'")
    @db.exec("DELETE FROM SubPeeps WHERE MainPeepID='#{peepid}'")
  end
end



