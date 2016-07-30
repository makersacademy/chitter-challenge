feature 'log in' do
  scenario 'I can log into my account' do
    sign_up
    log_in
    expect(page).to have_content('test')
  end
  scenario 'I can\'t log into my account if i use the wrong password' do
    sign_up
    log_in(password: 'wrong password')
    expect(page).to have_content('Username or Password is incorrect')
  end
end
