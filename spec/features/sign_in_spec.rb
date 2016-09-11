require './app/models/user'

feature 'user sign in' do

let!(:user) do
  User.create(email: 'email@isp.com',
    password: '1234',
    password_confirmation: '1234')
end

  scenario 'user can sign in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, email@isp.com"
  end

  def sign_in(email: , password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
