# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'log out' do
  before(:each) do
  User.create(name: 'Georgia',
              username: 'grmillsy',
              email: 'g@hotmail.com',
              password: '123',
              password_confirmation: '123')
  end
  xscenario 'I want to log out of my account' do
    log_in(username: 'grmillsy', password: '123')
    click_button 'Log out'
    expect(page).to have_content "Goodbye, Georgia"
    expect(page).not_to have_content "Hello there, Georgia"
    end
end
