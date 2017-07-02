feature 'Viewing peep timestamps' do
  scenario 'see the time that a peep was created' do
    visit('/peeps/new')
    fill_in :message, with: 'Hello Chitter'
    click_button('Post new Peep')

    within 'ol#peeps' do
      t = Time.now
      formatted = t.strftime("%b %d %Y %I:%M %p")
      expect(page).to have_content(formatted)
    end
  end
end
