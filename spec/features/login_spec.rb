feature 'log in' do
  scenario 'signed-up user can log in' do
    sign_up
    click_button 'Log out'
    fill_in('email', with: 'cispr@yahoo.com')
    fill_in('password', with: '123456')
    click_button 'Log in'
    expect(page).to have_content 'Here are the latest posts'
  end

  scenario "users can't log in if they get their email wrong" do
    sign_up
    click_button 'Log out'
    fill_in('email', with: 'northenlights@yahoo.com')
    fill_in('password', with: '123456')
    click_button 'Log in'
    expect(page).not_to have_content 'Here are the latest posts'
  end
  
  scenario "users can't log in if they get their password wrong" do
    sign_up
    click_button 'Log out'
    fill_in('email', with: 'northenlights@yahoo.com')
    fill_in('password', with: '123456')
    click_button 'Log in'
    expect(page).not_to have_content 'Here are the latest posts'
  end

end
