feature 'Viewing Peeps' do
  before :each do
    create(:peep, content: "First Peep")
    create(:peep, content: "Second Peep")
    create(:peep, content: "Third Peep")
  end

  context 'when on homepage' do
    scenario "users see peeps' content" do
      visit '/'
      expect(page).to have_content "First Peep"
      expect(page).to have_content "Second Peep"
      expect(page).to have_content "Third Peep"
    end
  end
end