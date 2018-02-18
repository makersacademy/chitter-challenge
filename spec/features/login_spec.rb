feature 'log in' do
  scenario 'attempt with valid credentials' do
    sign_in
    expect(page).to have_content 'Welcome testusername'
  end

  scenario 'attempt with invalid username' do
    visit '/'
    within 'table.sign-in' do
      fill_in 'username', with: 'wrongusername'
      fill_in 'password', with: 'Password1'
      click_button 'Sign in'
    end
    expect(page).to have_content "Incorrect login details supplied"
    expect(page).not_to have_content 'Welcome'
  end

  scenario 'attempt with invalid password' do
    visit '/'
    within 'table.sign-in' do
      fill_in 'username', with: 'testusername'
      fill_in 'password', with: 'wrongpassword'
      click_button 'Sign in'
    end
    expect(page).to have_content "Incorrect login details supplied"
    expect(page).not_to have_content 'Welcome'
  end
end
