feature 'signing up to chitter' do
  scenario 'a user is given the necessary fields to sign up' do
    visit('/sign_up')
    expect(page).to have_content('Sign up to Chitter')
    expect(page).to have_field 'name'
    expect(page).to have_field 'email'
    expect(page).to have_field 'handle'
    expect(page).to have_field 'password'
  end

  # scenario 'when a user fills in their information they are taken to a confirmation page' do
  #   visit('/sign_up')
  #   fill_in 'name', with: 'Tina Belcher'
  #   fill_in 'email', with: 'boyz4now4evr@talk21.com'
  #   fill_in 'handle', with: 'equestranaut2000'
  #   fill_in 'password', with: 'jimmyjr1234'
  #   expect(page).to have_content("You're all signed up! Let's start chatting chit!")
  # end
end
