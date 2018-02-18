require_relative 'web_helpers'

feature "adding comments to the database" do
  scenario "user comments to the database" do
    sign_up
    log_in
    click_button("Add a comment to a peep")
    fill_in "id", with: "1"
    fill_in "text", with: "not funny at all"
    click_button("Submit comment")
    expect(page).to have_content "not funny at all"
  end
end
