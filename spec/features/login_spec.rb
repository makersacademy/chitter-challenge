feature 'login page' do
  scenario 'a user can visit a login page' do
    visit('/')
    click_button 'login'
    expect(page).to have_content('Enter Email')
    expect(page).to have_content('Enter Password')
  end

  scenario 'logging in returns to the homepage with a welcome message' do
    visit('/')
    click_button 'login'
    fill_in 'Enter Email', with: 'donotreply@mail.com'
    fill_in 'Enter Password', with: 'Qwe1'
    click_button 'Login'
    expect(current_path).to eq('/')
    expect(page).to have_content('Hi, anon')
  end
end
