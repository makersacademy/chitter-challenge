feature "Registering on Chitter" do
  scenario "click register and fill in form" do
    visit '/'
    click_link 'Register'
    fill_in :name, with: 'Ash Ketchum'
    fill_in :username, with: '@red'
    fill_in :email, with: 'ash@pallet.com'
    fill_in :password, with: 'pikachu123'
    fill_in :confirm_password, with: 'pikachu123'

    click_button 'Register'
    expect(page).to have_content "Thank you for registering with Chitter. Login to start Peeping!"
  end

  scenario "passwords do not match" do
    visit '/'
    click_link 'Register'
    fill_in :name, with: 'Ash Ketchum'
    fill_in :username, with: '@red'
    fill_in :email, with: 'ash@pallet.com'
    fill_in :password, with: 'pikachu123'
    fill_in :confirm_password, with: 'pikachu12'

    click_button 'Register'
    expect(page).to have_content "Passwords do not match"
  end

  scenario "username already in db" do
    add_user_to_db
    visit '/'
    click_link 'Register'
    fill_in :name, with: 'Ash Ketchum'
    fill_in :username, with: '@red'
    fill_in :email, with: 'pikachu@pallet.com'
    fill_in :password, with: 'pikachu123'
    fill_in :confirm_password, with: 'pikachu123'

    click_button 'Register'
    expect(page).to have_content "Username already taken"
  end

  scenario "email already in db" do
    add_user_to_db
    visit '/'
    click_link 'Register'
    fill_in :name, with: 'Ash Ketchum'
    fill_in :username, with: '@blue'
    fill_in :email, with: 'ash@pallet.com'
    fill_in :password, with: 'pikachu123'
    fill_in :confirm_password, with: 'pikachu123'

    click_button 'Register'
    expect(page).to have_content "Email is already in use"
  end
end
