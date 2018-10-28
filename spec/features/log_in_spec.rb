# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Logging in to an account' do
  before do
    create_account
  end

  scenario 'User can log in to account on the index page' do
    login
    expect(page).to have_content "Hi Caitlin"
  end
end
