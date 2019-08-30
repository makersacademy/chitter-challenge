feature 'sign in to chitter' do
  scenario 'can sign in with a valid username and password' do
    visit '/'
    sign_in

    expect(page).to have_content('Signed in as admin@chitter.com')
  end
  scenario 'can\'t sign in if username not valid' do
    visit '/'
    click_button 'Sign in'
    fill_in(:email, with: 'notsignedup@chitter.com')
    fill_in(:password, with: 'password1234')
    click_button 'Sign in'

    expect(page).to have_content('Your email and/or password was incorrect')
  end
  scenario 'can\'t sign in if username not valid' do
    visit '/'
    click_button 'Sign in'
    fill_in(:email, with: 'admin@chitter.com')
    fill_in(:password, with: 'thewrongpassword')
    click_button 'Sign in'

    expect(page).to have_content('Your email and/or password was incorrect')
  end
end
