feature 'user can sign in' do
  let!(:user) do
    User.create(email: 'example@example.com',
                password: 'example',
                password_confirmation: 'example')
  end

  scenario 'user has correct information' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome to Chitter, #{user.email}"
  end

  
end
