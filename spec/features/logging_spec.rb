require './spec/factories/user'

feature 'loggin in and out' do
  scenario 'cannot log in with wrong credentials' do
    user = create :user
    visit 'session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'wrong_password'
    click_button 'Log in'
    expect(current_path).to eq('/session/new')
    expect(page).not_to have_content "Hi, #{user.username}"
    expect(page).to have_content 'Wrong credentials. Please try again.'
  end

  scenario 'exit session after signed out' do
    user = create :user
    visit 'session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
    click_button 'Log out'
    expect(current_path).to eq('/session/new')
    expect(page).not_to have_content "Hi, #{user.username}"
  end
end
