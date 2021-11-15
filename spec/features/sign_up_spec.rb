feature 'Sign up' do
  scenario 'A user is able to visit a site and sign up to chitter' do
    visit("/")
    click_link 'Sign up'
    fill_in 'username', with: 'Mr Chitter'
    fill_in 'email', with: 'example@email.com'
    fill_in 'password', with: 'letMeIn1'
    click_button 'Sign up'
    expect(page).to have_content('Mr Chitter')
  end
end