feature 'user_signup' do
  scenario 'User signs up with username, email and password' do
    visit '/'
    click_button 'Sign up'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome user1!")
  end
end
