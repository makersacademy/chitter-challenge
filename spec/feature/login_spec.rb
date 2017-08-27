feature "Login Page" do
  scenario "Page loads" do
    visit '/login'
    expect(page.status_code).to eq 200
  end

  scenario "Logs in when correct details given" do
    fill_in :username, with: "UserTest"
    fill_in :password, with: "Password Test"
    click_button "Login"
    expect(current_path).to eq('/feed')
  end
end
