feature 'users' do
  scenario 'sign up to increase user count' do
    expect{ sign_in }.to change{ User.count }.by 1
  end

  scenario 'welcome user on homepage when signed up' do
    sign_in
    expect(page).to have_content 'Welcome JohnDude'
    expect(current_path).to eq '/'
  end

  scenario 'don\'t allow multiple sign ups for same mail' do
    create_user
    expect{ sign_in }.not_to change{ User.count }
    expect(page).to have_content 'Username already exists!'
    expect(page).to have_content 'Email already exists!'
  end

  scenario 'user can sign in if registered' do
    create_user
    sign_up
    expect(page).to have_content 'Welcome JohnDude'
    expect(current_path).to eq '/'
  end

  scenario 'user cannot sign in with incorrect password' do
    create_user
    visit '/session/new'
    fill_in :username, with: 'JohnDude'
    fill_in :password, with: 'ThisIsTheWrongPassword!'
    click_button 'Sign in!'
    expect(page).to have_content 'Username or password is incorrect'
  end

  scenario 'user cannot sign in if not registered' do
    visit '/session/new'
    fill_in :username, with: 'JohnDude'
    fill_in :password, with: 'J0hn123!'
    click_button 'Sign in!'
    expect(page).to have_content 'Username or password is incorrect'
  end

  scenario 'sign out' do
    create_user
    sign_up
    click_button 'Sign out'
    expect(page).not_to have_content 'Welcome JohnDude'
    expect(page).to have_content 'Sign in or Sign Up'
  end
end
