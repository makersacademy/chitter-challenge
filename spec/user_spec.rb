require 'user'

describe User do
  let(:new_user) { User.new('Lou', 'loushark', 'loushark@gmail.com', 'Sharks@reC00l')}

  it 'initializes a user with user information(name, username, email, password)' do
    expect(new_user.name).to eq 'Lou'
    expect(new_user.username).to eq 'loushark'
    expect(new_user.email).to eq 'loushark@gmail.com'
    expect(new_user.password).to eq 'Sharks@reC00l'
  end
end
