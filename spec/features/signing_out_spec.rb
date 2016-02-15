feature 'user sign out' do

  before do
    User.create(name: 'Bob', email: 'bob@gmail.com',
                password: 'password',
                password_confirmation: 'password')
    sign_in
  end

  scenario 'a user can sign out of their account' do
    click_button "Sign Out"
    expect(page).to have_content "Goodbye!"
  end
  
end
