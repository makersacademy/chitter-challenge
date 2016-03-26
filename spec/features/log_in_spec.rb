feature 'allows login' do
  doubles
  
  scenario 'has correct credentials' do
    log_in(username: maker.username, password: maker.password)
    expect(page).to have_content "Oh hey #{maker.name}, what will you peep about today?"
  end

  scenario 'authenticates user log in with valid email and password' do
    logged_in_maker = Maker.authenticate(maker.username, maker.password)
    expect(logged_in_maker).to eq maker
  end

  scenario 'fails authenication with wrong password' do
    expect(Maker.authenticate(maker.username, 'not_password')).to be_nil
  end

  scenario 'informs email/password mismatch' do
    log_in(username: maker.username, password: 'not_password')
    expect(page).to have_content "Email & Password combo is wrong!"
  end
end
