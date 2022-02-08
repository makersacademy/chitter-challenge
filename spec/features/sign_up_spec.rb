# frozen_string_literal: true

feature 'signing up' do
  scenario 'a user can signup' do
    visit('/chitter')
    click_button 'sign-up'

    fill_in 'email', with: 'example@email.com'
    fill_in 'password', with: 'password123'
    click_button 'submit'

    expect(page).to have_content 'Welcome, example@email.com'
  end
end
