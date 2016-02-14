feature 'Creating a new user account' do
  scenario 'User can create a new account and automatically get logged in' do
    visit('/signup')
    fill_in(:username, with: 'Chet_Chitter')
    fill_in(:password, with: 'cutthechatterred2')
    click_button('Sign up!')
    expect(page).to have_content('Welcome, Chet_Chitter!')
  end
end