def empty_database
  @connection.exec('
    TRUNCATE users;
    TRUNCATE peeps;
  ')
end

def add_test_users_directly(user_details)
  user_details.each do |user|
    @connection.exec("
      INSERT INTO users VALUES(DEFAULT, '#{user['email']}');
    ")
  end
end

def add_test_users
  test_user_1 = User.create(:email => 'bob@testing.com')
  test_user_2 = User.create(:email => 'fred@testing.com')
  @test_users = [test_user_1, test_user_2]
end

def add_test_peeps
  add_test_users
  test_user_id = User.all[0].id

  test_peep_1 = Peep.create(
    :message => "Some test words",
    :created_at => '2018-05-12 18:17:23 +0100',
    :user_id => test_user_id
  )
  test_peep_2 = Peep.create(
    :message => "More test words",
    :created_at => '2018-05-12 18:17:25 +0100',
    :user_id => test_user_id
  )
  test_peep_3 = Peep.create(
    :message => "MORE TESTING!?!?!",
    :created_at => '2018-05-12 18:18:24 +0100',
    :user_id => test_user_id
  )
  @test_peeps = [test_peep_1, test_peep_2, test_peep_3]
end

def log_in_form(user_email)
  fill_in 'login_email', with: user_email
  click_button 'Login'
end

def full_log_in_journey(user_email)
  visit '/'
  log_in_form(user_email)
end
