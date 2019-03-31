require './lib/user.rb'

describe '.signup' do
  it 'user signs up for chitter' do
    user = User.signup(name:"Dave", username:"dave123" ,email:"dave@hotmail.com",password:"password")

    expect(user.name).to eq 'Dave'
    expect(user.username).to eq "dave123"
    expect(user.email).to eq "dave@hotmail.com"
  end
end
