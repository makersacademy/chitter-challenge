feature "/sign_up" do

  scenario 'login page' do
    visit('/sign_up')
    expect(page).to have_selector(:link_or_button, 'back')
    expect(page).to have_selector(:link_or_button, 'sign_up')
    expect(page).to have_content('We have another Chitter*rer')
    expect(page).to have_content('username:')
    expect(page).to have_content('password:')
    expect(page).to have_content('confirm password:')
    expect(page).to have_content('email:')
  end

  scenario 'shows error when trying to sign up and username exist' do
    visit('/sign_up')
    fill_in('username', with: 'testperson1')
    fill_in('password', with: 'password')
    fill_in('confirm_password', with: 'password')
    fill_in('email', with: 'test@email.com')
    click_on('sign_up')
    expect(page).to have_content('username already exist')
  end

  scenario 'shows error when passwords dont match' do
    visit('/sign_up')
    fill_in('username', with: 'testperson2')
    fill_in('password', with: 'password')
    fill_in('confirm_password', with: 'wrongpassword')
    fill_in('email', with: 'test@email.com')
    click_on('sign_up')
    expect(page).to have_content("passwords don't match")
  end

  scenario 'shows error when email not right format' do
    visit('/sign_up')
    fill_in('username', with: 'testperson2')
    fill_in('password', with: 'password')
    fill_in('confirm_password', with: 'password')
    fill_in('email', with: 'testemail.com')
    click_on('sign_up')
    expect(page).to have_content("Not an email")
  end

  scenario 'shows error when email not right format' do
    visit('/sign_up')
    fill_in('username', with: 'testperson2')
    fill_in('password', with: 'password')
    fill_in('confirm_password', with: 'password')
    fill_in('email', with: 'test@email.com')
    click_on('sign_up')
    expect(page).to have_content("testperson2 the Chitter*rer")
  end

  scenario 'shows error when email not right format' do
    visit('/sign_up')
    fill_in('username', with: 'testperson2')
    fill_in('password', with: 'password')
    fill_in('confirm_password', with: 'password')
    fill_in('email', with: 'email@email.com')
    click_on('sign_up')
    expect(page).to have_content("Email already in use")
  end

end
