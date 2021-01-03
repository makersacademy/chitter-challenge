feature 'sign up' do
  scenario 'users can sign up' do
    visit '/chitter'
    click_button 'CLICK HERE TO SIGN UP'
    fill_in :username, with: 'Kiki Dawson'
    fill_in :email, with: 'kiki@chitter.com'
    click_button 'Sign up'

    expect(page).to have_content "You have signed up to Chitter"
  end
end
