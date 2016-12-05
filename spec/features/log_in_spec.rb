

RSpec.feature 'Log in' do
  let!(:user) do
    User.create(email: 'jane@email.com', password:'abcd1234')
  end

  scenario 'User can log in with email and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content 'Welcome Back #{user.email}'
  end

end


def sign_in(email:, password:)
  visit '/log-in/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
