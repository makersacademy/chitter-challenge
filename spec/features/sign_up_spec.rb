# frozen_string_literal: true

feature 'signing up' do
  scenario 'a user can signup' do
    sign_up_user

    expect(page).to have_content 'Welcome, example@email.com'
  end
end
