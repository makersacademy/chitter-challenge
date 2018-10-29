feature 'log in' do
  scenario 'user can visit log in page' do
    visit '/'
    click_button('Already signed up?')
    expect(page).to have_content 'Enter your username'
    expect(page).to have_content 'Enter your password'
  end

  scenario 'peeps are posted from that users account' do
    visit '/'
    click_button('Already signed up?')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:password, with: 'password')
    click_button('Log In')
    expect(page).to have_content 'Logged in as Imogen Misso'
  end

  scenario 'user can sign out' do
    visit '/user/logged_in'
    click_button('Log out')
    expect(page).to have_button 'Sign Up'
  end

end
