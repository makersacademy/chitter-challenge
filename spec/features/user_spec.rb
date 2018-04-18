feature "Sign up" do
  scenario "User signs in and peeps, sees their name and handle with peep" do
    sign_up
    fill_in :peep_text, with: "test peep"
    expect(page).to have_content "@louism"
    expect(page).to have_content "louis"
  end
end
