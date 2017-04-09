feature 'user signs up' do
  scenario 'user can enter signup details' do
    visit '/users/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    click_button 'Sign Up'
    expect(current_path).to eq '/index'
    expect(page).to have_content 'Welcome, bob@gmail.com'
    expect(User.count).to eq 1
  end
end
