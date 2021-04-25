feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_button 'Sign up'
    expect(current_path).to eq '/user/new'
    fill_in('name', with: 'test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(current_path).to eq '/chitter'
    expect(page).to have_content "Welcome, test"
  end
end
