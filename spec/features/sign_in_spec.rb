feature 'User Sign In' do

  let!(:user) do
    User.create(email: 'user@example.co.uk', password: 'apple', password_confirmation: 'apple')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome #{user.email}"
  end

end
