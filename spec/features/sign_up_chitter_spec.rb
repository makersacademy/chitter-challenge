feature 'Sign up for Chitter' do
  scenario 'Sign up as new user' do
    sign_up
    expect(page).to have_content("Welcome to my Chitter!")
    users = User.all
    expect(users.first.username).to eq "Shaun"
    expect(users.first.password).to eq "012345"
  end
end