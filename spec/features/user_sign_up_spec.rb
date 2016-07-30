feature 'user sign up' do
  scenario 'I can sign up for an account' do
    expect{ sign_up }.to change(User, :count).by 1
  end
  scenario 'I can\'t sign up with an email address that is taken' do
    sign_up
    sign_up(username: 'test2')
    expect(page).to have_content('Email is already taken')
  end
  scenario 'I can\'t sign up with a username that is taken' do
    sign_up
    sign_up(email: 'email@test.com')
    expect(page).to have_content('Username is already taken')
  end
  scenario 'I can\'t sign up if my password and confirmation dont match' do
    sign_up(password: 'wrong password')
    expect(page).to have_content('Password does not match the confirmation')
  end
end
