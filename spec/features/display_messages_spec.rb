require 'peep_helpers'

feature "Messages are displayed in reverse chronological order" do
  scenario "Saved messages are returned in reverse chronological order" do
    create_new_peep_one("abc")
    create_new_peep_two("zyx")

    expect(page).to_not have_content "error"
    expect(page.text).to match(/zyx.*abc/m)
  end
end
