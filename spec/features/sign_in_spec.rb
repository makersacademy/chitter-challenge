feature "sign in" do
  scenario "user signs in" do
    visit '/'
    fill_in 'name', with: 'Florence Hapgood'
    fill_in 'email', with: "flohapgood@icloud.com"
    fill_in 'username', with: "Flo"
    fill_in 'password', with: 'code'
    click_button "Submit"
    expect(page).to have_content("Welcome Flo")
  end
end
