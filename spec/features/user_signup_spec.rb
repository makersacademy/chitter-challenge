feature 'User Sign Up' do
  scenario 'A user is created' do
    sign_up_correctly
    expect(User.count).to eq 1
  end

  scenario 'No user created if password not confirmed' do
    sign_up_incorrect_password
    expect(User.count).to eq 0
  end

end
