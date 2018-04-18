require 'pg'

def fill_data
  connection = PG.connect(dbname: 'chitter_test')

  # Add the test data
  connection.exec("INSERT INTO peep (peep, name, handle) VALUES('what up', 'Zuckerberg' , '@zuckyboi');")
  connection.exec("INSERT INTO peep (peep, name, handle) VALUES('Louis is so awesome', 'Daniel Tooke' , '@t00kie_da_w00kie');")
  connection.exec("INSERT INTO peep (peep, name, handle) VALUES('He LIED! LIED! LIED!', 'Donald J. Trump' , '@realDonaldTrump');")
end

def sign_up
  visit '/peeps'
  click_button "Sign up to Chitter"
  fill_in :email, with: "l@gmail.com"
  fill_in :password, with: "password"
  fill_in :name, with: "louis"
  fill_in :handle, with: "@louism"
  click_button "Sign up"
end
