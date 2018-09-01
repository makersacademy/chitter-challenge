feature 'Sign up to chitter' do
  scenario 'enter your details' do
    visit('/sign_up')
    fill_in('name', with: 'name test')
    fill_in('user_name', with: 'user name test')
    fill_in('email', with: 'email@test')
    fill_in('password', with: 'password test')
    click_button('Submit')

    expect(page).to have_content('sign up complete')

  end
end
