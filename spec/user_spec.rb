require 'user'

describe User do
  it 'saves a new user to the database' do
    User.sign_up(first_name: 'Jen', last_name: 'Card', email: 'jc@hmail.com', password: '123', username: 'jc')
    expect(User.first_name).to eq 'Jen'
    expect(User.username).to eq 'jc'
  end

end
