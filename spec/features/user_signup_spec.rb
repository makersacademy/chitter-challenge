feature 'user_signup' do
  scenario 'User signs up with username, email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome user1!")
  end
end
