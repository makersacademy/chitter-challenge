feature 'signing up to Chitter' do
  scenario 'user can sign up' do
    visit '/users/new'
    fill_in :name, with: "user"
    fill_in :user_name, with: "user123"
    fill_in :email_address, with: 'user@user.com'
    fill_in :password, with: 'password123'
    click_button "Sign up"
    visit '/peeps'
    expect(page).to have_content "Hey there, user"
  end
end
