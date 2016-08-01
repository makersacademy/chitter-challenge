feature 'user can sign up for chitter' do
  scenario 'user signs up' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    expect(User.count). to eq 1
    expect(User.first.name). to eq "Samed Yalniz"
  end
  scenario 'user signs up with wrong password confirmation' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password122"
    fill_in 'name', with: "Cengiz Koc"
    fill_in 'username', with: "cengo"
    expect{click_button"Sign up"}.to change{User.count}.by 0
    within 'ul#errors' do
      expect(page).to have_content "Password does not match the confirmation"
    end
  end
    scenario 'user cannot signup without an email address' do
      visit '/users'
      fill_in 'password', with: "password123"
      fill_in 'password_confirmation', with: "password123"
      fill_in 'name', with: "Cengiz Koc"
      fill_in 'username', with: "cengo"
      click_button "Sign up"
      expect(User.count).to eq 0
      expect(page).to have_content("Email must not be blank")
    end
    scenario 'user cannot signup without a username' do
      visit '/users'
      fill_in "email", with: "s.yalniz@hotmail.de"
      fill_in 'password', with: "password123"
      fill_in 'password_confirmation', with: "password123"
      fill_in 'name', with: "Cengiz Koc"
      click_button "Sign up"
      expect(User.count).to eq 0
      expect(page).to have_content("Username must not be blank")
    end
    scenario 'user cannot signup without a name' do
      visit '/users'
      fill_in "email", with: "s.yalniz@hotmail.de"
      fill_in 'password', with: "password123"
      fill_in 'password_confirmation', with: "password123"
      fill_in 'username', with: "cengo"
      click_button "Sign up"
      expect(User.count).to eq 0
      expect(page).to have_content("Name must not be blank")
    end
    scenario 'user cannot signup without a password' do
      visit '/users'
      fill_in "email", with: "s.yalniz@hotmail.de"
      fill_in "name", with: "Cengonomino"
      fill_in 'username', with: "cengo"
      click_button "Sign up"
      expect(User.count).to eq 0
      expect(page).to have_content("Password must not be blank")
    end
    scenario 'user cannot signup with invalid email' do
      visit '/users'
      fill_in "email", with: "s.yalniz"
      fill_in 'password', with: "password123"
      fill_in 'password_confirmation', with: "password123"
      fill_in "name", with: "Cengonomino"
      fill_in 'username', with: "cengo"
      click_button "Sign up"
      expect(User.count).to eq 0
      expect(page).to have_content ("Email has an invalid format")
    end


end
