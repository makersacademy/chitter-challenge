feature 'login' do
  scenario 'signed-up user can login' do
    sign_up
    click_button 'Logout'
    fill_in('email', with: 'cispr@yahoo.com')
    fill_in('password', with: '123456')
    click_button 'Login'
    expect(page).to have_content 'Here are the latest posts'
  end

  scenario "user can't login if they get their email wrong" do
    sign_up
    click_button 'Logout'
    fill_in('email', with: 'northenlights@yahoo.com')
    fill_in('password', with: '123456')
    click_button 'Login'
    expect(page).not_to have_content 'Here are the latest posts'
  end
end
