# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                username: 'myusername',
                name: 'MyName')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    visit '/sessions/new'
    within("#session") do
      fill_in(:email,    with: email)
      fill_in(:password, with: password)
    end
    click_button('Sign out')
    expect(page).to have_content('goodbye!') # where does this message go?
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
