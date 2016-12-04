feature 'duplicate username' do
  scenario 'I should not be able to enter a username that is already in use' do
    expect{duplicate_username}.to change{User.count}.by 1
  end
end
