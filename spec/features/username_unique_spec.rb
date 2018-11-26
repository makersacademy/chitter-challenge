feature 'Usernames are Unique' do
  scenario 'users should not be able to create an account with an existing username' do
    visit('/')
    click_link('up')
    fill_in('username', with: '@a')
    fill_in('name', with: 'B')
    fill_in('email', with: 'c@d.com')
    fill_in('password', with: '1234')
    fill_in('repassword', with: '1234')
    click_button('submit')
    click_link('out')
    click_link('up')
    fill_in('username', with: '@a')
    fill_in('name', with: 'C')
    fill_in('email', with: 'd@e.com')
    fill_in('password', with: '1234')
    fill_in('repassword', with: '1234')
    click_button('submit')
    expect(page).to have_content("that username is already taken")
  end
end