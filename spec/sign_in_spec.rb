feature 'sign in' do

  let!(:user) do
    User.create(email: 'dog@dog.com', password_method2: 'password', username: 'labrador', password_confirmation: 'password')
  end

  scenario 'with correct login details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
