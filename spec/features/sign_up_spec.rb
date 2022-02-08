# frozen_string_literal: true

feature 'signing up' do
  scenario 'a user can signup' do
    visit('/chitter')
    click_button 'Sign Up'

    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('Submit')
  end
end
