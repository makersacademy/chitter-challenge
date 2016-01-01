# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit ('/signup')
    fill_in 'email', with: 'jollygreengiant@gmail.com'
    fill_in 'password', with: '2016'
    fill_in 'name', with: 'Joe Giant'
    fill_in 'username', with: 'jollygreengiant'
    expect(User.all.length).to eq(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end
