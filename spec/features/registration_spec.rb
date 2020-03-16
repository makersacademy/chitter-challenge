# frozen_string_literal: true

feature 'registration' do
  scenario 'a user can sign up' do
    sign_in

    expect(page).to have_content 'Welcome, Jane Doe'
  end
end
