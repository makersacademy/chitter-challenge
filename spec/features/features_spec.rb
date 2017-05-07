# This relies on 'sign up', a helper method set out in web_helper.rb
feature 'allows users to register new accounts' do
  scenario 'user can sign up with e-mail, password, name and username' do
    DatabaseCleaner.start
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Logged in as w_gant'
    expect(User.first.email).to eq 'w_gant@yahoo.co.uk'
    DatabaseCleaner.clean
  end
end

feature 'User sign in' do
  # This gives us a 'memoized' helper method, with user equal to the return value of .create (the new object)
    let!(:user) do
      User.create(email: 'user@example.com',
      password: 'secret1234')
    end
  # This uses keyword arguments (ruby v2.0 and later only) to accept the parameters, working like a hash
  scenario 'with correct credentials' do
    DatabaseCleaner.start
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Logged in as #{user.email}"
    DatabaseCleaner.clean
  end

end

feature 'User sign out' do
  scenario 'shows "You have logged out" after clicking \'sign out\' button' do
    DatabaseCleaner.start
    sign_up
    click_button 'Sign out'
    expect(page).to have_content "You have signed out"
    DatabaseCleaner.clean
  end

end
