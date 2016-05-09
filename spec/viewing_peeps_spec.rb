feature 'Can view submitted peeps' do
  scenario 'Submitted peep is shown' do
    Peep.create(
      body: 'Hello Chitter!'
      )

    visit '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'Hello Chitter!'
    end
  end
end