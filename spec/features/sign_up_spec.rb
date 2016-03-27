feature 'sign_up_spec: Sign up' do

  scenario 'user can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Account created. Please log in.'
  end

  scenario 'user attempts to sign up with existing user name' do
    2.times { sign_up }
    expect(page).to have_content('That username already exists in Chitter.')
  end

  scenario 'user attempts to sign up with existing email' do
    2.times { sign_up }
    expect(page).to have_content('That email address already exists in Chitter.')
  end

  scenario 'user attempts to sign up with badly formatted email' do
    expect{ sign_up( email: 'test.com' )}.not_to change(User, :count)
    expect(page).to have_content('That doesn\'t look like a valid email address.')
  end

  scenario 'user attempts to sign up with no email address' do
    expect{ sign_up( email: nil )}.not_to change(User, :count)
    expect(page).to have_content('We need to your email address.')
  end

  scenario 'user attempts to sign up with no username' do
    expect{ sign_up( username: nil )}.not_to change(User, :count)
    expect(page).to have_content('You need a username to peep.')
  end

end
