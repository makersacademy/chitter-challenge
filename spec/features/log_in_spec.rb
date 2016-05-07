feature 'user can log in' do

  scenario 'user can log in' do
    User.create(email: 'alice@example.com', password: 'orange', password_confirmation: 'orange')
    visit '/sessions/new'
    fill_in :email,    with: 'alice@example.com'
    fill_in :password, with: 'orange'
    click_button 'Log in'
    expect(page).to have_content('Welcome, alice@example.com')
  end

end