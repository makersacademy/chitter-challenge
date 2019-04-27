feature 'Viweing the peeps' do
  scenario 'visiting the Chitter index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end

  feature 'Posting a message' do
    scenario 'A user can post a peep' do
      visit('/peeps')

      expect(page).to have_content " "
    end
  end

end
