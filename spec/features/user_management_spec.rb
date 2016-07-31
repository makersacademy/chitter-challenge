
feature 'sign up' do
  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, mat@example.com')
    expect(User.first.email).to eq('mat@example.com')
  end

  scenario "User can't sign up without matching password" do

    expect { sign_up(password_confirmation: 'anything') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
  end
end

feature 'sign in' do

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end



  it 'authenticates when given a valid email address and password' do
     authenticated_user = User.authenticate(user.email, user.password)
     expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  scenario 'signs in with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
