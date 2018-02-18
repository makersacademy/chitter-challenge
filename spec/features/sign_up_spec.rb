feature 'sign up to Chitter' do
  scenario 'click sign up button, sign up with your details' do
    visit '/cheets'
    fill_in('email', with: 'marcus@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Marco Polo')
    fill_in('user name', with: 'MarcoPo')
    click_button 'Sign up'
    expect(page).to have content 'Congratulations, you have signed up.'
    expect(page).to have_selector(:button, "Sign in")
    expect(page).to have_selector(:button, "Return to homepage")
  end
end
