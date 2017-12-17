feature "user sign in" do

  scenario "user can sign in" do
    user_sign_up
    user_sign_in
    expect(page).to have_content "Welcome Ellie W"
  end
end
