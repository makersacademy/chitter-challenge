feature 'User creation' do
  scenario "A user can signup" do
    visit '/'
    click_button 'Create new account'

    expect(current_path).to eq '/users/new'
    fill_in('username', with: "username")
    fill_in('password', with: "password")
    click_button('Create account')

    expect(current_path).to eq '/messages'
    expect(page).to have_content "Welcome username"

  end
end
