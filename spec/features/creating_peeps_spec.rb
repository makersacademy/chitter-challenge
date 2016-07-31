feature 'create a peep' do
  scenario 'user adds a peep message' do
    visit '/peeps/'
    fill_in "message", :with => "This is a message"
    click_button('Add Peep')

    within 'ul#peeps' do
      expect(page).to have_content "This is a message"
    end
  end
end
