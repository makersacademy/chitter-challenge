feature 'Emails are Unique' do
  scenario 'users should not be able to create an account with an existing email' do
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
    fill_in('username', with: '@b')
    fill_in('name', with: 'C')
    fill_in('email', with: 'c@d.com')
    fill_in('password', with: '1234')
    fill_in('repassword', with: '1234')
    click_button('submit')
    expect(page).to have_content("there is already an account with that email")
  end
end