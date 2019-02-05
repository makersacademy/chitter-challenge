# frozen_string_literal: true

feature 'Signing in to Chitter' do
  scenario 'users should be able to sign in to their account' do
    make_a_user

    visit('/')
    click_link('in')
    fill_in('email', with: 'c@d.com')
    fill_in('password', with: '1234')
    click_button('submit')
    expect(page).to have_content("sign out @a\npeep")
  end
end
