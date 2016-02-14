feature 'User account management' do
  scenario 'User can create a new account and automatically get logged in' do
    expect{create_account}.to change{User.count}.by(1)
    expect(User.first.username).to eq ('chet')
    within 'article#header' do
      expect(page).to have_content('Welcome, chet!')
    end
  end

  scenario 'An unauthenticated user can log in with correct details' do
    User.create(username: 'chet', password: 'cutthechatterred2')
    log_in
    within 'article#header' do
      expect(page).to have_content('Welcome, chet!')
      expect(page).to have_content('Log out')
    end
  end
end