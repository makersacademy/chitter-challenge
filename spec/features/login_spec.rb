feature 'Login Page' do
  scenario 'Has 3 buttons sign up, sign in, guest' do
    visit('/')
    expect(page).to have_button 'Sign Up'
    expect(page).to have_button 'Sign In'
    expect(page).to have_button 'Guest'
  end
end
