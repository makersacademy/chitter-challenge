# frozen_string_literal: true

feature 'Signing out of Chitter' do
  scenario 'users should be able to sign out of their account' do
    make_a_user

    visit('/')
    click_link('in')
    fill_in('email', with: 'c@d.com')
    fill_in('password', with: '1234')
    click_button('submit')
    click_link('out')
    expect(page).not_to have_content('sign out @a')
    expect(page).to have_content('sign in / up')
  end
end
