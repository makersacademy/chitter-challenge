feature 'Log in' do
  scenario 'a user can log in' do
    visit '/peeps'

    click_button 'Log In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Log In'

    fill_in :email, with: 'marius2020@example.com'
    fill_in :password, with: 'apassword'
    click_button 'Sign In'

    expect(current_path).to eq '/peeps'
  end
end
