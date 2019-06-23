feature 'Sign Up' do
  scenario "A user can sign up and become a member of Chitter" do
    visit("/members/new")

    fill_in('name', with: 'Test Person')
    fill_in('username', with: 'test123')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome to Chitter, Test Person"
  end
end
