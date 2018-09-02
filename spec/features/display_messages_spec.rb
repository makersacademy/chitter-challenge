require 'create_new_peep_helper'

feature "Messages are displayed in reverse chronological order" do
  let(:example_1) { "abc" }
  let(:example_2) { "zyx" }

  scenario "Saved messages are returned in reverse chronological order" do
    create_new_peep(example_1)
    create_new_peep(example_2)

    expect(page).to_not have_content "error"
    expect(page.text).to match(/#{example_2}.*#{example_1}/m)
  end
end
