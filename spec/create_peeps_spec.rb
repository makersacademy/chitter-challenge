feature "creating peeps" do

  scenario "I can add a single peep to chitter" do

    visit "/peeps/new"

    fill_in "title", with: "This is the title of my peep"
    fill_in "content", with: "This is the content of my peep"

    click_button "Create peep"

    expect(current_path).to eq "/peeps"

    within "ul#peeps" do
      expect(page).to have_content("This is the title of my peep")
    end

  end
end
