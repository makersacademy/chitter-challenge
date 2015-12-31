feature 'user sign in' do

  let(:user) do
    User.create(name: 'Edward Kerry',
                user_name: 'Edward',
                email: 'edwardkerry@gmail.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'a registered user can sign in' do
    sign_in(email: user.email, password: user.password )
    expect(page).to have_content 'Edward\'s Chitter'
  end

  scenario 'when signed in users may not sign up' do
    sign_in
    expect(page).not_to have_button "Sign up"
  end

end
