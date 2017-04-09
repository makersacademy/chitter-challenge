feature 'User signs out' do
  scenario 'while being signed in' do
    sign_up
    visit('/user/signin')
    fill_in('email', with: 'a@gmail.com')
    fill_in('password', with: '1234')
    click_button('Sign in')
    click_button('Sign out')
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, a@gmail.com')
  end
end
