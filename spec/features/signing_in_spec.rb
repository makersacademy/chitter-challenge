# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'signing up to chitter' do

  scenario 'I can sign up and must confirm my password' do
    expect{sign_up}.to change{ User.count }.by(1)
    expect(User.first.username).to eq 'Wynndow'
  end

  scenario 'I can\'t sign up if confirmation doesn\'t match password' do
    expect{sign_up(password_confirmation: 'notpassword')}.not_to change{ User.count }
  end

  scenario 'I receive an error message if passwords don\'t match' do
    sign_up(password_confirmation: 'notpassword')
    expect(current_path).to eq '/users'
    expect(page).to have_content('Please enter matching passwords')
  end

  scenario 'I can\'t sign up with an existing email address' do
    sign_up
    sign_up
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I can\'t sign up with an existing username' do
    sign_up
    sign_up(email: 'chris@chris.com')
    expect(current_path).to eq '/users'
    expect(page).to have_content('Username is already taken')
    end

  scenario 'I can\'t sign up if i leave the email address blank' do
    expect{sign_up(email: nil)}.not_to change{User.count}
  end

  scenario 'I can\'t sign up if i leave the name blank' do
    expect{sign_up(name: nil)}.not_to change{User.count}
  end

  scenario 'I can\'t sign up if i leave the username blank' do
    expect{sign_up(username: nil)}.not_to change{User.count}
  end

  scenario 'I can\'t sign up if i use a wrongly formatted email' do
    expect{sign_up(email: 'bademail')}.not_to change{User.count}
  end

end
