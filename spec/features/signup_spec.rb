feature 'Sign up page has jumbotron' do
  scenario 'User visits sign up main page' do
    visit('/signup')
    expect(page).to have_content "ChitterBox"
    expect(page).to have_content "Responsive chat app using using bootstrap, sinatra and Postgres for DB."
  end
end

feature 'Sign up page has main h1' do
  scenario 'User visits sign up main page' do
    visit('/signup')
    expect(page).to have_content "Sign up to chat"
  end
end

feature 'Sign up page takes to /login after sign up' do
  scenario 'User fills up sign up info & successfully signs up' do
    visit('/signup')
    fill_in('txt_first_name', with: 'Test')
    fill_in('txt_last_name', with: 'User')
    fill_in('txt_email', with: 'test@test.com')
    fill_in('txt_username', with: 'testuser')
    fill_in('txt_pwd', with: 'testpassword')
    click_on('btn_signup')
    expect(page).to have_content("Sign up successful, please sign in.")
  end
end

feature 'Sign up page shows error after failed sign up' do
  scenario 'User fills up sign up info & gets error message' do
    visit('/signup')
    fill_in('txt_first_name', with: 'Test')
    fill_in('txt_last_name', with: 'User')
    fill_in('txt_email', with: 'test@test.com')
    fill_in('txt_username', with: 'testuser')
    fill_in('txt_pwd', with: 'testpassword')
    click_on('btn_signup')
    expect(page).to have_content("Error signing up, username taken.")
  end
end
