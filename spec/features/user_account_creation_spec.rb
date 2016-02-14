feature 'Creating a new user account' do
  scenario 'User can create a new account and automatically get logged in' do
    expect{create_account}.to change{User.count}.by(1)
    expect(User.first.username).to eq ('Chet')
    expect(page).to have_content('Welcome, Chet!')
  end
end