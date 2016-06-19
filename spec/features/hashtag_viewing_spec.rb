feature "Viewing peeps filtered by hashtags" do
  scenario "Non existent hashtags will list no peeps" do
    visit("/hashtag/no")

    within find(".timeline") do
      expect(page.text).to be_empty
    end
  end
end
