feature 'User sign in' do
  scenario 'with correct username and password' do
    User.create(name: 'Ed', 
                username: 'mr_ed',
                email: 'email123@example.com', 
                password: 'password123', 
                password_confirmation: 'password123')
    sign_in
    expect(page).to have_content "Welcome, Ed"
  end
end

