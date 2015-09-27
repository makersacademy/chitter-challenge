feature 'User sign up' do


  scenario 'I can sign up as a new user' do
    user = build(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Anthony')
    expect(User.first.name).to eq('Anthony')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up user }.not_to change(User, :count)
  end

  scenario 'raises flash when password does not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up user }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Please refer to the following errors below:'
  end

  scenario 'cant sign up without entering an email' do
    user = build(:user, email: '')
    expect { sign_up user }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'I cannot sign up with an existing email' do
    user = create(:user, email: 'alice@example.com')
    sign_up (user)
    expect { sign_up (user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    user = create(:user, username: 'adellanno')
    sign_up (user)
    expect { sign_up (user) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end


end

feature 'User sign in' do

 let(:user) do
   User.create(email: 'user@example.com',
               password: 'secret1234',
               password_confirmation: 'secret1234',
               name: 'Anthony',
               username: 'adellanno')
 end

 scenario 'with correct credentials' do
   sign_in(email: user.email,   password: user.password)
   expect(page).to have_content "Welcome, #{user.name}"
 end

end

feature 'User signs out' do

  let(:user) do
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


