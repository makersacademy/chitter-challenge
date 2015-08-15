feature 'User sign up' do
  scenario 'I can sign up for Chitter' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sam@makersacademy.com')
    expect(User.first.email).to eq('sam@makersacademy.com')
  end

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :first_name, with: user.first_name
    fill_in :last_name, with: user.last_name
    fill_in :username, with: user.username
    click_button 'Sign up'
  end

  scenario 'I cannot sign up with an existing email' do
    user = build :user
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    user = build :user
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

end

feature 'User sign in' do

  let(:user) do
    User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

   def sign_in(email:, password:)
     visit '/sessions/new'
     fill_in :email, with: user.email
     fill_in :password, with: user.password
     click_button 'Sign in'
   end

end
