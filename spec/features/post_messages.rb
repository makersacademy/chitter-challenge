feature 'completing sign in form' do
  scenario 'A user can log in via sign in form' do
    visit('/chitter/index')
    fill_in('user_name', with: 'user')
    click_button('Submit')
    expect(page).to have_content 'Welcome User!'
  end
end
