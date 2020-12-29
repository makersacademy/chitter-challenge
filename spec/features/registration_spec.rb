require_relative '../helpers.rb'

include Helpers

feature 'registration' do

  before(:each) do
    @user = instance_double("Book",
        :email => 'test@example.com',
        :password => 'password123',
        :name => 'rubberduck'
      )
  end

  scenario 'a maker can sign up' do
    sign_up(@user)

    expect(page).to have_content "Welcome, rubberduck"
  end

  scenario 'if username/email are already in use user get info to try again' do

    sign_up(@user)

    click_button('Sign out')

    sign_up(@user)

    expect(page).to have_content "Username or email currently in use, please try again"
  end
end
