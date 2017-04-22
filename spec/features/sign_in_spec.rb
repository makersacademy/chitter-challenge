feature 'sign in' do

  scenario 'successful sign in' do
    signup
    visit '/sessions/new'
    fill_in 'username', with: 'HappyFriends99'
    fill_in 'password', with: 'password1234'
    click_button 'Sign In'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, HappyFriends99'
  end

  scenario 'unsuccessful sign in' do
    signup
    visit '/sessions/new'
    fill_in 'username', with: 'HappyFriends99'
    fill_in 'password', with: 'password4321'
    click_button 'Sign In'
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The username or password is incorrect'
  end
end
