require_relative '../helpers.rb'

include Helpers

feature 'authentication' do

  before(:each) do
    @user = instance_double("Book",
        :email => 'test@example.com',
        :password => 'password123',
        :name => 'rubberduck'
      )
    Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')
  end

  it 'a user can sign in' do

    sign_in(@user)

    expect(page).to have_content 'Welcome, rubberduck'
  end

  scenario 'a user can sign out' do

    sign_in(@user)

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, rubberduck'
    expect(page).to have_content 'You have signed out.'
  end

  scenario 'a user sees an error if they get their email wrong' do

    visit '/sessions/new'
    fill_in(:email, with: 'wrongemail@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, rubberduck'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, rubberduck'
    expect(page).to have_content 'Please check your email or password.'
  end

end
