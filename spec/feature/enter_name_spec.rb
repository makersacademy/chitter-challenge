feature 'visiting the sign up page' do
  scenario 'see the page heading' do
    visit '/sign-up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'can fill in sign up details and get welcome message' do
    visit '/sign-up'
    fill_in 'Name', with: 'Ed'
    fill_in 'Handle', with: '@Ed'
    fill_in 'Password', with: 'password1'
    fill_in 'Email', with: 'ed@generic_mail.com'
    click_button 'Submit'
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content 'Thank you for signing up to Chitter!'
  end

end