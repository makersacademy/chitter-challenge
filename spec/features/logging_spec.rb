require './spec/factories/user'

feature 'logging in and out' do
  scenario 'cannot log in with wrong credentials' do
    user = create :user
    log_in user, 'wrong password'
    expect(current_path).to eq('/session/new')
    expect(page).not_to have_content "Hi, #{user.username}"
    expect(page).to have_content 'Wrong credentials. Please try again.'
  end

  scenario 'exit session after signed out' do
    user = create :user
    log_in user, user.password
    click_button 'Log out'
    expect(current_path).to eq('/session/new')
    expect(page).not_to have_content "Hi, #{user.username}"
  end
end
