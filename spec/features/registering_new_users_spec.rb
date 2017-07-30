feature 'FEATURE: registering new users' do
  scenario 'signing up as a new user' do
    visit '/users/new'
    fill_in 'username', with: "user123"
    fill_in 'email', with: "123@test.com"
    fill_in 'password', with: "123abc"
    fill_in 'password_confirm', with: "123abc"
    expect { click_button 'Sign up!' }.to change{ User.count }.by(1)
    expect(page).to have_content "Welcome user123"
  end
end
