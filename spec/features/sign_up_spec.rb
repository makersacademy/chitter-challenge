require_relative 'web_helper'

feature 'A user can sign up to use chitter' do
  scenario 'A user signs up' do
    sign_up

    expect(page).to have_content('Welcome Magnus')
    expect(page).to have_content('Email: Magnus@1000sons.co.pr')
    expect(page).to have_content('Username: The Crimson King')
  end

  scenario 'A user cannot sign up to chitter with the same email twice' do
    sign_up_twice

    expect(page).to have_content("Email already in use")
  end
end
