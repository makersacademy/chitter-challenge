feature "/" do

  scenario 'login page' do
    visit('/')
    expect(page).to have_selector(:link_or_button, 'login')
    expect(page).to have_selector(:link_or_button, 'Sign up')
    expect(page).to have_content('Chitter')
    expect(page).to have_content('username:')
    expect(page).to have_content('password:')
  end

    scenario 'shows error when trying to log in where username does not exist' do
      visit('/')
      fill_in('username', with: 'testperson2')
      fill_in('password', with: 'password')
      click_on('login')
      expect(page).to have_content('username does not exist')
    end

    scenario 'shows error when trying to log in where username does not exist' do
      visit('/')
      fill_in('username', with: 'testperson1')
      fill_in('password', with: 'wrong password')
      click_on('login')
      expect(page).to have_content('incorrect password')
    end

end
