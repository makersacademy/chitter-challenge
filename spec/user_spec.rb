require 'user' 

describe User do 
  it 'checks if username already exists' do
    expect(User.unique_username?('lillozza')).to eq(true)
  end 

  it 'checks if email already exists' do
    expect(User.unique_email?('lauren@blah.com')).to eq(false)
  end 
end 