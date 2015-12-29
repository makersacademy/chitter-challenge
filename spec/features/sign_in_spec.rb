feature 'user sign in' do

  let(:user) do
    User.create(user_name: 'Edward',
                email: 'edwardkerry@gmail.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'a registered user can sign in' do
    sign_in(email: user.email, password: user.password )
    expect(page).to have_content 'Edward\'s Chitter'
  end

end
