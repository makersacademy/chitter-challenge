feature 'Sign up' do
  scenario 'A user is able to visit a site and sign up to chitter' do
    visit("/")
    click_link 'Sign up'
    fill_in 'Username', with: 'Mr Chitter'
    fill_in 'Email', with: 'example@email.com'
    fill_in 'Password', with: 'letMeIn1'
    fill_in 'Please confirm password', with: 'letMeIn1'
    click_button 'Sign up'
    expect(page).to have_content('Tell us what is on your mind.')
  end
end