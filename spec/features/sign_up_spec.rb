require 'pry'
feature 'User Sign Up' do

  it 'creates a user' do
    expect{sign_up}.to change{User.count}.by(1)
  end
end