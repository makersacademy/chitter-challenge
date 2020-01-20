feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    within(:css, 'form.new-user') do
      fill_in 'name', with: 'Umberto Valente'
      fill_in 'username', with: 'uValente'
      fill_in 'email', with: 'mock@gmail.com'
      fill_in 'password', with: 'psw123'
      click_button 'Register'
    end
    expect(page).to have_content 'Welcome uValente!'
  end

  scenario "a user can't use the same email twice" do
    visit '/users/new'
    within(:css, 'form.new-user') do
      fill_in 'name', with: 'Umberto Valente'
      fill_in 'username', with: 'uValente'
      fill_in 'email', with: 'mock@gmail.com'
      fill_in 'password', with: 'psw123'
      click_button 'Register'
    end
    click_button 'Sign Out'
    visit '/users/new'
    within(:css, 'form.new-user') do
      fill_in 'name', with: 'New Name'
      fill_in 'username', with: 'New Username'
      fill_in 'email', with: 'mock@gmail.com'
      fill_in 'password', with: 'psw123'
      click_button 'Register'
    end
    expect(page).to have_content 'Username or email already in use'
    expect(page).not_to have_content 'Welcome New Username'
  end

  scenario "a user can't use the same username twice" do
    visit '/users/new'
    within(:css, 'form.new-user') do
      fill_in 'name', with: 'Umberto Valente'
      fill_in 'username', with: 'uValente'
      fill_in 'email', with: 'mock@gmail.com'
      fill_in 'password', with: 'psw123'
      click_button 'Register'
    end
    click_button 'Sign Out'
    visit '/users/new'
    within(:css, 'form.new-user') do
      fill_in 'name', with: 'New Name'
      fill_in 'username', with: 'uValente'
      fill_in 'email', with: 'new@gmail.com'
      fill_in 'password', with: 'psw123'
      click_button 'Register'
    end
    expect(page).to have_content 'Username or email already in use'
    expect(page).not_to have_content 'Welcome New Username'
  end
end
