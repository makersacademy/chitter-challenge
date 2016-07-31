feature 'User sign in' do

  scenario 'with correct credentials' do
    sign_up
    visit '/sessions/new'
    fill_in :email, with: 'sam@makersacademy.com'
    fill_in :password, with: 's3cr3t'
    click_button 'Sign in'
    expect(page).to have_content "You've signed in as - tansaku"
  end

end
