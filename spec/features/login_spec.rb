feature 'Log In' do

  before(:each) do
    sign_up_first
  end

  scenario 'I can sign in to my Chitter account' do
    log_in("jon@winterfell.com", "winterishere")
    expect(page).to have_content "Welcome, Jon Snow"
  end

  scenario 'I tried to sign in but entered the wrong email' do
    log_in("jon@castleblack.com", "winterishere")
    expect(page).to have_content "Sign in failed"
  end

  scenario 'I tried to sign in but entered the wrong password' do
    log_in("jon@winterfell.com", "iknownothing")
    expect(page).to have_content "Sign in failed"
  end

end
