feature 'User sign in' do

  let!(:user) do
    User.create(name: 'Trish', email: 'Trish@person.com',
                username: 'Wizard_Trish', password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Welcome, #{user.username}")
  end

  scenario 'raises error when incorrect username used' do
    sign_in(username:'Muggle_Trish', password:user.password)
    expect(current_path).to eq '/sessions'
    expect(page).to have_content('The username or password is incorrect')
  end

end
