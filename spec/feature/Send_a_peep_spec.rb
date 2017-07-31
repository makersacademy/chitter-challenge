require_relative 'web_helper'
feature "Send a Peep " do

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'send a peep when signed in' do
    sign_in(email: user.email,   password: user.password)

    expect(page).to have_content "Welcome, #{user.email}"
    visit '/messages'
    fill_in :peep, with: "Hello world"
    click_button "Peep"

      expect(page).to have_content "Hello world"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
  end
