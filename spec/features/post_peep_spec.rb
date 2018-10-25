feature "Post peep" do
  scenario "User can sign up and post first peep" do
    sign_up_generic_user
    fill_in "new_peep", with: "Just setting up my chittr"
    click_button "Peep"
    expect(page).to have_content "@username"
    expect(page).to have_content "Just setting up my chittr"
  end
end
