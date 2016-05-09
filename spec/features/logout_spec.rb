feature "logging out" do
  scenario "click logout button to delete session of user" do
    sign_up
    logout
    expect(page).not_to have_content "Hello Amy!"
    expect(current_path).to eq "/peeps"
  end
end
