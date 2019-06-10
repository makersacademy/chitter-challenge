feature 'login page' do
  scenario 'a user can visit a login page' do
    visit('/')
    click_button 'Login'
    expect(page).to have_content('Enter Email')
    expect(page).to have_content('Enter Password')
  end

  scenario 'logging in returns to the homepage with a welcome message' do
    visit('/')
    click_button 'Login'
    fill_in 'Enter Email', with: 'donotreply@mail.com'
    fill_in 'Enter Password', with: 'Qwe1'
    click_button 'Login'
    expect(current_path).to eq('/')
    expect(page).to have_content('Hi, anon')
  end

  scenario 'logging in with unrecognised details returns an error' do
    visit('/')
    click_button 'Login'
    fill_in 'Enter Email', with: 'dfwef@mail.com'
    fill_in 'Enter Password', with: 'dfdf'
    click_button 'Login'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Your username or password were incorrect, please try again')
  end

  scenario 'logging in with wrong password returns an error' do
    visit('/')
    click_button 'Login'
    fill_in 'Enter Email', with: 'donotreply@mail.com'
    fill_in 'Enter Password', with: 'dfdf'
    click_button 'Login'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Incorrect password, please try again')
  end
end
