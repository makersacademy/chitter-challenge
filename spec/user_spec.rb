require 'user' 

describe User do 
  it 'returns true if username already exists' do
    expect(User.unique_username?('lillozza')).to eq(true)
  end 

  it 'checks if email already exists' do
    expect(User.unique_email?('lauren@blah.com')).to eq(false)
  end 

  it 'returns the user id from username' do 
    expect(User.id('lozza_peeps')).to eq('1')
  end 
end 