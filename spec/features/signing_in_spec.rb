feature 'Signing in' do

  scenario 'User can sign in with correct credentials' do
    sign_up
    sign_in(username: 'jsmith2016', password: 'pizza123!')
    expect(page).to have_content "Welcome jsmith2016"
  end

  scenario 'Sign in fails with incorrect username' do
    sign_up
    click_button 'Sign out'
    sign_in(username: 'wrong username', password: 'pizza123!')
    expect(page).to have_content "Email or password incorrect"
  end

  scenario 'Sign in fails with incorrect password' do
    sign_up
    click_button 'Sign out'
    sign_in(username: 'jsmith2016', password: 'wrong pw')
    expect(page).to have_content "Email or password incorrect"
  end

  scenario 'Can sign in again after signing out' do
    sign_up
    click_button 'Sign out'
    sign_in(username: 'jsmith2016', password: 'pizza123!')
    expect(page).to have_content "Welcome jsmith2016"
  end

end
