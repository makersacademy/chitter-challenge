require 'pry'
feature 'User Sign Up' do

  it 'creates a user' do
    expect{sign_up}.to change{User.count}.by(1)
  end

  it 'does not create a user when password is entered incorrectly' do
    expect{sign_up_incorrect_password}.not_to change{User.count}
  end

end