# User Story currently being tested:

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User can sign up' do

  scenario 'As a new user visiting site' do
    visit '/'
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, ash@ash.com'
    expect(User.first.email).to eq 'ash@ash.com'
  end

end