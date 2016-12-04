require 'spec_helper.rb'

feature 'sign in' do

  let!(:user) do
    User.create(email: 'hello@example.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'user can sign in with correct email and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content 'Welcome'
  end

end
