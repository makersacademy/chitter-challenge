feature 'Viewing peep timestamps' do
  scenario 'see the time that a peep was created' do
    visit('/peeps/new')
    fill_in :message, with: 'Hello Chitter'
    click_button('Post new Peep')

    within 'ol#peeps' do
      expect(page).to have_content(Time.now)
    end
  end
end
