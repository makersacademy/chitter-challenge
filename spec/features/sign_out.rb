require "spec_helper.rb"

feature 'user signs out' do

  before (:each) do
    User.create(name: 'Dave',
                username: 'Big Dave',
                email: 'dave@email.com',
                password: 'secret123')
  end

  scenario 'user successfully signs out' do
    sign_in(email: user.email, password: user.password)
    click_button ('Sign out')
    expect(page).to have_content('You have successfully logged out')
    expect(page).not_to have_content('Welcome to Chitter dave@email.com')
  end
end
