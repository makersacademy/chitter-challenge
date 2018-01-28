
feature 'creating a user account' do
  scenario 'visit the homepage page and sign-up to Chitter' do
    sign_up
    expect(current_path).to eq '/post_peep'
    expect(page).to have_content("Welcome User")
    expect(User.count).to eq 1
  end

  scenario 'invalid email address entered' do
    visit '/'
    fill_in 'name', with: 'User'
    fill_in 'username', with: 'username'
    fill_in 'email', with: ' '
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(User.count).to eq 0
  end

  scenario 'password confirmation' do
    visit '/'
    fill_in 'name', with: 'User'
    fill_in 'username', with: 'username'
    fill_in 'email', with: 'user.email@gmail.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'error'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(User.count).to eq 0
  end
end
