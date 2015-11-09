require "spec_helper.rb"

feature 'User sign in' do
  let(:user) do
    User.create(name: 'Dave',
                username: 'Big Dave',
                email: 'dave@email.com',
                password: 'secret123')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome to Chitter #{user.email}"
  end
end
