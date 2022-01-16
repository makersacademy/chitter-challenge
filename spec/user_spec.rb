require 'user'

describe User do
  it 'Users name is returned' do
    User.create('Thumper')
    expect(User.name).to eq 'Thumper'

  end
end