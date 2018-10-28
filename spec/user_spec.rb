require 'user'

describe User do
  it 'saves a new user to the database' do
    User.sign_up(first_name: 'Jen', last_name: 'Card', email: 'jc@hmail.com', password: '123', username: 'jc')
    expect(User.first_name).to eq 'Jen'
    expect(User.username).to eq 'jc'
  end
end

describe '#User.unique?' do
  before do
    User.sign_up(first_name: 'Jen', last_name: 'Card', email: 'jc@hmail.com', password: '123', username: 'jc')
  end
  it 'returns false if the username has already been registerd' do
    expect(User.unique?('jc', 'jencard@hmail.com')).to eq false
  end
  it 'returns false if the email has already been registerd' do
    expect(User.unique?('jencard', 'jc@hmail.com')).to eq false
  end
  it 'returns true if the email and username are unique' do
    expect(User.unique?('jill', 'jillfrost@hotmail.com')).to eq true
  end
end
