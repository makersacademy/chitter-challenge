feature 'sign up' do
  scenario 'can access the sign up page' do
    visit('/')
    click_button('Sign up')
    fill_in('username', with: 'mmm')
    fill_in('password', with: 'ooh')
    fill_in('password_check', with: 'oh')
    click_button('Submit')

    expect(page).to have_content("Error: Passwords don't match")
  end
end
