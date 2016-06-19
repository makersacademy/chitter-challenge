feature "FEATURE: Viewing Spits" do
  scenario "I can see exiting spits on the spits page" do
    Spit.create(content: "My life is more awesome than yours")
    visit '/spits'
    expect(page.status_code).to eq 200
    within "ul#spits" do
      expect(page).to have_content("My life is more awesome than yours")
    end
  end
end
