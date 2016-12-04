feature 'requires username' do
  scenario 'I need to enter a username to sign up' do
    requires_username
    expect{requires_username}.to change{User.count}.by 0
  end
end
