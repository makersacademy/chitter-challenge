# frozen_string_literal: true

feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jane Doe')
    fill_in('username', with: '@username')
    click_button('Submit')

    expect(page).to have_content 'Welcome, Jane Doe'
  end
end
