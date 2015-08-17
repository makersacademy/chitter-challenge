feature 'User sign up' do

  let(:user) do
    user = build :user
  end

  scenario 'can sign up for Chitter' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sam@makersacademy.com')
    expect(User.first.email).to eq('sam@makersacademy.com')
  end

  scenario 'cannot sign up with an existing email' do
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up with an existing username' do
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

end

feature 'User logs in' do

  let(:user) do
    user = create :user
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end

feature 'User signs out' do

  let(:user) do
    user = create :user
  end

  scenario 'while being signed in' do
    sign_in(email: user.email,   password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('You have logged out')
    expect(page).not_to have_content('Welcome, sam@makersacademy.com')
  end
end
