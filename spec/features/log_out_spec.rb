feature 'user log out' do

  before(:each) do
    User.create(name: 'Kate McCaffrey',
                user_name: 'Mac',
                email: 'mac@shaper.com',
                password: 'netrunner1')
  end

  scenario 'whilst logged in' do
    log_in
    click_button('Log out')
    expect(page).to have_content("Goodbye, thanks for using chitter!")
    expect(page).not_to have_content("Welcome to chitter Kate McCaffrey")
  end

end
