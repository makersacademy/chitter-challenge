feature 'sign in' do
  before(:all) do
    sign_up
  end

  scenario 'user signs in correctly' do
    sign_in
    expect(page).to have_content 'You are now logged in.'
  end

  scenario 'user enters incorrect credentials' do
    sign_in(password: 'wrongpassword')
    expect(page).to have_content 'The email or password was incorrect'
  end

  xscenario 'user can reset a forgotten password' do
    
  end
end
