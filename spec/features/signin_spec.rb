feature 'signing in' do

  scenario 'a user can sign in to chitter' do
    sign_up
    signin
    expect(page).to have_content 'Hello Emma, welcome to Chitter!'
  end

  scenario 'a user enters the wrong username' do
    sign_up
    signin('Emma', 'bestpasswordever')
    expect(page).to have_content('Username or password incorrect')
  end

  scenario 'a user enters the wrong password' do
    sign_up
    signin('chitterer', 'wrongpassword')
    expect(page).to have_content('Username or password incorrect')
  end

end
