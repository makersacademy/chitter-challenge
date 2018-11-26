feature "you are able to add your details" do
  scenario "it saves your details" do
    visit "/"
    fill_in('username', with: 'My username')
    fill_in('email', with: 'example@domain.com')
    fill_in('name', with: 'John Doe')
    fill_in('password', with: 'pa33w0rd')
    click_button "Sign up"
    expect(page).to have_content "Welcome John Doe"
    expect(page).to have_button "Add peep"
  end
end
