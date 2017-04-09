feature 'Registered user logging in' do
  scenario 'user logs in' do
    sign_up
    sign_up_b
    visit('/user/signin')
    fill_in('email', with: 'a@gmail.com')
    fill_in('password', with: '1234')
    click_button('Sign in')
    expect(page).to have_content("Welcome A-dawg")
  end
end
