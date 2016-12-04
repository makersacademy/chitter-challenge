
feature "Sign up" do
  scenario "When user doesn't have a Chitter account" do
    visit "/"
    fill_in "email", :with => "keomony@gmail.com"
    fill_in "password", :with => "this is the password"
    click_button "Sign up"
    expect(page.current_path).to eq "/peeps"
    expect(page.status_code).to eq 200
  end
end
