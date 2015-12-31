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

  scenario 'correct email is needed' do
    sign_in(email: 'lies@lies.com', password: user.password)
    expect(page).to have_content 'The email or password was incorrect'
  end

  scenario 'correct password is needed' do
    sign_in(email:user.email, password: 'lies')
    expect(page).to have_content 'The email or password was incorrect'
  end

  scenario 'when signed in users may not sign up' do
    sign_in
    expect(page).not_to have_button "Sign up"
  end

end
