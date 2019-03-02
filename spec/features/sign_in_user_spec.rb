feature 'signing in' do
  scenario 'user can sign in' do

    sign_up_for_chitter
    
    log_in_to_chitter

    expect(page).to have_content 'Hello, testuser'

  end

  scenario 'user is shown a flash error when using bad credentials' do

    sign_up_for_chitter
    
    visit '/accounts/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: 'badpw'
    click_button 'Log-in!'

    expect(page).to have_content 'Bad username and password. Please try again.'

  end
end
