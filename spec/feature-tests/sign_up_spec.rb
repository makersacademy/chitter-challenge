feature 'sign up process' do
  scenario 'user visits sign up page and can save their info' do
    visit('/sign-up')
    fill_in('username', with: 'Test')
    fill_in('email', with: 'test@test.com')
    click_button('Sign up')
    expect(page).to have_content('Thanks for signing up, Test!')
  end
end