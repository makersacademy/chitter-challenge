feature 'user registration' do
  scenario 'user can sign up' do
    visit('/users/new')
    fill_in :name, with: "John Smith"
    fill_in :username, with: "JSmith"
    fill_in :email, with: "testing@testmail.com"
    fill_in :password, with: "Rosebud"
    click_button "Sign Up"

    expect(page).to have_content "John Smith"
  end

  scenario 'user can log in' do
    #to do
  end
  scenario 'user can log out' do
    # to do
  end
end