feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, adaymesa')
    expect(User.first.email).to eq('adaymesagc@gmail.com')
  end

  scenario 'When the user name is already taken' do
    sign_up
    sign_up
    expect(page).to have_content('Username is already taken')
  end
end

