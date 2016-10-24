feature 'Sign in' do

  # let!(:user) do
  #   User.create(user_name: 'kyaw', email: 'kyaw@gmail.com', password: '1234', password_confirmation: '1234')
  # end

  scenario 'with correct credentials' do
    User.create(user_name: 'kyaw', email: 'kyaw@gmail.com', password: '1234', password_confirmation: '1234')
    sign_in(email: 'kyaw', password: '1234')
    expect(page).to have_content("Welcome, kyaw")
  end

end
