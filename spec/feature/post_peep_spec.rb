feature "posting peeps" do
  scenario "I can post a peep to Chitter" do
    visit('/new')
    fill_in(:peep, with: "I'm peeping!")
    click_button("peep!")

    within 'ul#peeps' do
      expect(page).to have_content("I'm peeping!")
    end
  end
end
