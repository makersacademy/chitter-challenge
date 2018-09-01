feature 'Log out to chitter' do

  scenario 'user can log out of chitter' do
    visit('/sign_up')
    sign_up_one
    click_button('LOG IN')
    fill_in('user_name', with: 'user name test')
    fill_in('password', with: 'password test')
    click_button('Submit')
    click_button('LOG OUT')
    expect(page).not_to have_content('user name test is currently logged in')
    expect(page).to have_content('no one is currently logged in')
  end

  scenario 'displays no one is currently logged in when no one is logged in' do
    visit('/')
    expect(page).to have_content('no one is currently logged in')
  end
end
