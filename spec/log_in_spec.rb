feature 'User signs in' do
  before(:each) do
    User.create(email: 'bob@gmail.com', password: 's3cr3t', password_confirmation: 's3cr3t')
  end
  scenario 'successfully signs in' do
    visit '/sessions/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    click_button 'Sign in'
    expect(current_path).to eq '/users/mypeeps'
    expect(page).to have_content 'bob@gmail.com logged in'
  end

  scenario 'User signs out' do
      visit '/sessions/new'
      fill_in 'email', with: 'bob@gmail.com'
      fill_in 'password', with: 's3cr3t'
      click_button 'Sign in'
      click_button 'Log Out'
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content 'Goodbye'
  end
end
