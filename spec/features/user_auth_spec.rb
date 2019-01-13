feature 'User Authentification' do
  scenario 'User can sign up' do
    visit '/'
    click_on 'Sign Up'
    fill_in :email, with: '1@2.com'
    fill_in :password, with: 'securepassword'
    fill_in :username, with: 'User1'
    click_button 'Submit'
    expect(page.current_path).to eq('/profile')
    expect(page).to have_content('Welcome User1')
  end

  scenario 'User can log in' do
    sign_up
    visit '/'
    click_on 'Log In'
    fill_in :email, with:'1@2.com'
    fill_in :password, with: 'securepassword'
    click_button 'Submit'
    expect(page.current_path).to eq('/profile')
    expect(page).to have_content('Welcome User1')
  end
end
