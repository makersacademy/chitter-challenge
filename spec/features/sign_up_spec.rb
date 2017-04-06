feature 'Sign up for Chitter' do
  scenario 'To post user must sign up' do
    visit '/users/new'
    fill_in 'email', with: 'ruan@email.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'name', with: 'Ruan'
    fill_in 'user_name', with: 'ruano'
    click_button 'Sign up'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Ruan'
    expect(User.count).to eq 1

  end
end
