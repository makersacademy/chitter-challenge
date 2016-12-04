
feature "Login" do
  scenario "user fills in their email address and password" do
    visit "/"
    expect(page.status_code).to eq(200)
    fill_in "email", :with => "keomony@gmail.com"
    fill_in "password", :with => "this is the password"
    click_button "Login"
    expect(page.current_path).to eq "/peeps"
  end
end
