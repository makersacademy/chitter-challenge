feature 'User sign up' do
  scenario 'I can sign up for Chitter' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sam@makersacademy.com')
    expect(User.first.email).to eq('sam@makersacademy.com')
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

feature 'User log in' do

  let(:user) do
    User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end

feature 'User signs out' do

  let(:user) do
    User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
  end

  scenario 'while being signed in' do
    sign_in(email: 'sam@makersacademy.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('You have logged out')
    expect(page).not_to have_content('Welcome, sam@makersacademy.com')
  end
end
