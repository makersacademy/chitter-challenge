RSpec.feature 'sign in' do

  let!(:user) do
    User.create(email: 'user@user.com',
                password: 'password123',
                name: 'User',
                username: 'username')
  end

  scenario 'with correct details' do
    sign_up
    sign_in
    expect(page).to have_content("Welcome, #{user.name}")
  end

end
