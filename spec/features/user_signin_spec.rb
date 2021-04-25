feature 'new user' do
  scenario "sign in" do
    visit '/'
    click_button 'NEW USER'

    expect(current_path).to eq '/user'
    fill_in('username', with: "username")
    fill_in('password', with: "password")
    fill_in('name', with: "name")
    fill_in('email', with: "email@hotmail.com")
    click_button('Create account')

    expect(current_path).to eq '/'
    #expect(page).to have_content "Welcome username"

  end
end