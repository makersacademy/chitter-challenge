feature 'Posting peeps' do
  scenario 'I can post a message(peep) to Chitter' do
    visit('/peeps/new')
    fill_in :message, with: 'Hello Chitter'
    click_button('Post new Peep')
    expect(page.status_code).to eq 200

    within 'ol#peeps' do
      expect(page).to have_content('Hello Chitter')
    end
  end
end
