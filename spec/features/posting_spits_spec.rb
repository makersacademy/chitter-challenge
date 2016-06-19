feature "FEATURE: Creating Spits" do
  scenario "I can create a new spit" do
    visit '/spits/new'
    fill_in "content", with: "My life is more awesome than yours"
    click_button "Spit it!"

    expect(current_path).to eq '/spits'

    within "ul#spits" do
      expect(page).to have_content("My life is more awesome than yours")
    end
  end
end
