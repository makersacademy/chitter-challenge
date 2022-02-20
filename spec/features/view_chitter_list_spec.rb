feature 'view a list of chitters' do
    scenario 'a user view the chitters' do
        connection = PG.connect(dbname: 'chitter_manager_test')
        connection.exec("INSERT INTO user_chitter (id, first_name, last_name, user_email, user_password, user_name) VALUES(1,'Shirley', 'Mac', 'mac@gmail.com', 'password', 'SAM11');")
        connection.exec("INSERT INTO chitter (user_id, peep, DATE) select id, 'peep' , NOW() from user_chitter where user_email = 'mac@gmail.com';")
        visit('/')
        expect(page).to have_content "peep"
    end
  end