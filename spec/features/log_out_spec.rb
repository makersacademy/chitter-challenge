feature 'log out' do
  scenario 'a user logs out of Chitter' do

    sign_in
    click_button("Log Out!")

    expect(page).to have_content "Welcome to Chitter!"
  end
end
