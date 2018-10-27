feature "Registering on Chitter" do
  scenario "click register and fill in form" do
    visit '/'
    click_link 'Register'
    fill_in :name, with: 'Ash Ketchum'
    fill_in :username, with: '@user'
    fill_in :email, with: '@user'
    fill_in :password, with: 'pikachu123'
    fill_in :confirm_password, with: 'pikachu123'

    click_button 'Register'
    expect(page).to have_content "Thank you for registering with Chitter. Login to start Peeping!"
  end
end
