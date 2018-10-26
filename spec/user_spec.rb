require './lib/user'

describe User do

  before do
    connection = PG.connect(dbname: 'chitterdb_test')
    connection.exec("INSERT INTO users VALUES(1, '@winter_coming', 'Ned Stark', 'jslittler@icloud.com', 'decapitate');")
  end

  it 'has a handle' do
    @user = User.new('@winter_coming', 'decapitate')
    expect(@user.handle).to eq '@winter_coming'
  end

  it 'has a user name' do
    @user = User.new('@winter_coming', 'decapitate')
    expect(@user.name).to eq 'Ned Stark'
  end

  it 'has a user email' do
    @user = User.new('@winter_coming', 'decapitate')
    expect(@user.email).to eq 'jslittler@icloud.com'
  end

  it 'can log in' do
    @user = User.new('@winter_coming', 'decapitate')
    expect(@user.logged_in).to eq true
  end

  it 'can log out' do
    @user = User.new('@winter_coming', 'decapitate')
    @user.log_out
    expect(@user.logged_in).to eq false
  end

end
