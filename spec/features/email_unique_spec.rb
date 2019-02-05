# frozen_string_literal: true

feature 'Emails are Unique' do
  scenario 'users cannot create an account with an existing email' do
    make_a_user

    visit('/')
    click_link('up')
    fill_in('username', with: '@b')
    fill_in('name', with: 'C')
    fill_in('email', with: 'c@d.com')
    fill_in('password', with: '1234')
    fill_in('repassword', with: '1234')
    click_button('submit')
    expect(page).to have_content('there is already an account with that email')
  end
end
