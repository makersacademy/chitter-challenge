require 'users'
require 'Time'
require_relative './database_helpers.rb'

describe '.create' do
  it 'creates a new account' do
    user = User.create(email: 'test@example.com', password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')

    # persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    # expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
    expect(user.username).to eq 'sjmog'
    expect(user.screenname).to eq 'Sam Morgan'
  end

  it "doesn't save the password in plaintext" do
    user = User.create(email: 'test@example.com', password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')

    # persisted_data = persisted_data(table: :users, id: user.id)

    expect(user.password).not_to eq "password123"
  end

  it "doesn't create acount if username already exists" do
    add_users_to_database()

    expect{User.create(email: 'test@example.com', password: 'password123', username: 'the_golden_C', screenname: 'Sam Morgan')}.to raise_error(DetailsAlreadyExist, "Username Already Taken")
  end

  it "doesn't create account if email already exists" do
    add_users_to_database()
    expect{User.create(email: "sargon_akkad@compuserve.com", password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')}.to raise_error(DetailsAlreadyExist, "Account with email address already exists")
  end

  context "doesn't create account if email is invalid" do
    it "because of missing @" do
      add_users_to_database()
      expect{User.create(email: "sargon_akkadcompuserve.com", password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')}.to raise_error(InvalidEmail, "sargon_akkadcompuserve.com is not a valid email")
    end

    it "because of missing . after @" do
      add_users_to_database()
      expect{User.create(email: "sargon_akkad@compuservecom", password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')}.to raise_error(InvalidEmail, "sargon_akkad@compuservecom is not a valid email")
    end
    it "because of only one letter after last ." do
      user_email = "sargon_akkad@compuserve.co.m"
      expect{User.create(email: user_email, password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')}.to raise_error(InvalidEmail, "#{user_email} is not a valid email")
    end
    it "because of .- before @" do
      user_email = "sarg.-on_akkad@compuserve.com"
      expect{User.create(email: user_email, password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')}.to raise_error(InvalidEmail, "#{user_email} is not a valid email")
    end

    it "because of .- after @" do
      user_email = "sargon_akkad@comp.-userve.com"
      expect{User.create(email: user_email, password: 'password123', username: 'sjmog', screenname: 'Sam Morgan')}.to raise_error(InvalidEmail, "#{user_email} is not a valid email")
    end
  end

  context ".check_login" do
    it "returns true if email exists and password is correct"

    it "returns true if username exists and password is correct"

    it "returns false if username exists but password is wrong"

    it "returns false if email exists but password is wrong"

    it "returns false if username doesnt exist"

    it "returns false if username doesnt exist"
  end
end