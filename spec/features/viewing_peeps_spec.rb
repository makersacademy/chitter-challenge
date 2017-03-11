feature "Viewing peeps" do
  scenario "User can see a list of peeps" do
    Peep.create(message: "What's up!")
    visit ('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content("What's up!")
    end
  end
end
