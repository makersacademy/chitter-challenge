feature 'log in' do
  scenario 'user can log into account' do
    visit '/chitter'
    click_button('Already signed up?')
    expect(page).to have_content 'Enter your username'
    expect(page).to have_content 'Enter your password'
  end

  scenario 'peeps are posted from that users account' do
    visit '/log_in'
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:password, with: 'password')
    click_button('Log in')
    expect(page).to have_content 'Logged in as Imogen Misso'
  end
end
