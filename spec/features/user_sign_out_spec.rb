feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    visit '/sessions/new'
    fill_in :email, with: 'sam@makersacademy.com'
    fill_in :password, with: 's3cr3t'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, tanskau')
  end

end
