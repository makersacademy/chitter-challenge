feature 'I can login into chitter as me' do

  scenario 'I am not logged in if my password is not correct' do
    signup
    login(password: 'incorrect')
    expect(current_path).to eq '/session/new'
    expect(page).to have_content('The username or password is not correct')
  end

  scenario 'I am logged in if my userid and password is correct' do
    signup
    login
    expect(current_path).to eq '/session'
    expect(page).to have_content('Hello, User1')
  end

  scenario 'I can log out when I\'m finished' do
    signup
    login
    click_link('Logout')
    expect(current_path).to eq ('/session')
    expect(page).to have_content('Goodbye User1!')
    end
end
