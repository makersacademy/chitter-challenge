feature 'password needs to be the same' do
  scenario 'I need to enter my password twice as the same to sign up' do
    different_passwords
    expect{different_passwords}.to change{User.count}.by 0
  end
end
