feature 'Signing in' do
  let!(:user) do
    User.create(name: 'Bart Simpson',
                user_name: 'Bart',
                email: 'bart@mail.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'User can sign in' do
    log_in(email: 'bart@mail.com', password: 'password123')
    expect(page).to have_content "Welcome Bart"
  end

end
