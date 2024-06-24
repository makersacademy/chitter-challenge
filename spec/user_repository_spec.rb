require "user_repository"

describe UserRepository do
  
  def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_data' })
  connection.exec(seed_sql)
  end


  before(:each) do 
    reset_users_table
  end

  # READ METHODS

  it "returns all the users" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 2
    expect(users[0].id).to eq 1
    expect(users[0].username).to eq "The Lord Of Chitter"
    expect(users[0].name).to eq "Francesco"
    expect(users[0].surname).to eq "Guglielmi"
    expect(users[0].email).to eq "gug.francesco@gmail.com"
    expect(users[0].pass).to eq "UShallNotPass"
    expect(users[0].posts_amount).to eq 1
  end

  it "throws an error if the id is not an Integer" do
    repo = UserRepository.new
    expect{ repo.find("ciao") }.to raise_error "id must be an Integer"
  end

  it "returns an user by id" do
    repo = UserRepository.new
    user = repo.find(2)

    expect(user.length).to eq 1
    expect(user[0].id).to eq 2
    expect(user[0].username).to eq "The Assistant"
    expect(user[0].name).to eq "Dobbie"
    expect(user[0].surname).to eq "none"
    expect(user[0].email).to eq "dobbie@email.com"
    expect(user[0].pass).to eq "ciao"
    expect(user[0].posts_amount).to eq 1
  end

  # CREATE METHOD  

  it "adds a user to the database" do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = "Johnny B Goode"
    new_user.name = "John"
    new_user.surname = 'Doe'
    new_user.email = 'jdoe@email.com'
    new_user.pass = '12345'
    new_user.posts_amount = 0

    repo.create(new_user)
    users = repo.all

    expect(users.length).to eq 3
    expect(users[-1].id).to eq 3
    expect(users[-1].username).to eq "Johnny B Goode"
    expect(users[-1].name).to eq "John"
    expect(users[-1].surname).to eq 'Doe'
    expect(users[-1].email).to eq 'jdoe@email.com'
    expect(users[-1].pass).to eq '12345'
    expect(users[-1].posts_amount).to eq 0
  end

  # DELETE METHOD  

  it "deletes an user from the database" do
    repo = UserRepository.new
    repo.delete(2)
    users = repo.all
    
    expect(users.length).to eq 1
    expect(users[-1].name).to eq "Francesco"
    expect(users[0].surname).to eq 'Guglielmi'

    repo.delete(1)
    users = repo.all

    expect(users).to eq []
  end

  # UPDATE METHODS

  it "updates the username of an user" do
    repo = UserRepository.new
    record = repo.find(2)[0]
    record.username = 'The Best'
    repo.update_username(record)

    users = repo.all
    expect(users[-1].username).to eq 'The Best'
  end

  it "updates the name of an user" do
    repo = UserRepository.new
    record = repo.find(2)[0]
    record.name = 'Steve'
    repo.update_name(record)

    users = repo.all
    expect(users[-1].name).to eq 'Steve'
  end

  it "updates the surname of an user" do
    repo = UserRepository.new
    record = repo.find(2)[0]
    record.surname = 'Jobs'
    repo.update_surname(record)

    users = repo.all
    expect(users[-1].surname).to eq 'Jobs'
  end

  it "updates the email of an user" do
    repo = UserRepository.new
    record = repo.find(2)[0]
    record.email = 'development@example.net'
    repo.update_email(record)

    users = repo.all
    expect(users[-1].email).to eq 'development@example.net'
  end

  it "updates the password of an user" do
    repo = UserRepository.new
    record = repo.find(2)[0]
    record.pass = 'passkey123'
    repo.update_pass(record)

    users = repo.all
    expect(users[-1].pass).to eq 'passkey123'
  end
end
