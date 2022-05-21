feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('username', with: 'test name')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome, test name"
  end
end
