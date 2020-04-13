feature "user can sign up" do
  scenario "user fills in form with their details" do
    visit '/signup'
    fill_in :name, with: 'Alex'
    fill_in :handle, with: 'Alex1'
    fill_in :email, with: 'alex@fake.com'
    fill_in :password, with: 'fakepassword'
    click_button 'Submit'

    expect(page).to have_content "Welcome to Chitter Alex1"
  end
end
