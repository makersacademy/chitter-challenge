feature 'Signing in' do
  let!(:user) { User.create(email: 'johndoe@internet.com', name: 'John Doe', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'with correct email & password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hi, #{user.name}!"
  end

  scenario 'with incorrect password' do
    sign_in(email: user.email, password: 'superduper')
    expect(page).to have_content 'Email and/or password are/is incorrect'
  end

  scenario 'with incorrect email' do
    sign_in(email: 'someotherjoe@otherinternet.com', password: user.password)
    expect(page).to have_content 'Email and/or password are/is incorrect'
  end

end
