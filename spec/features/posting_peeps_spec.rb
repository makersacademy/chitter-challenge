feature 'Posting peeps' do
  scenario 'I can post a message(peep) to Chitter' do
    Peep.create(message: 'Hello Chitter')
    visit('/peeps')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Hello Chitter')
    end
  end
end
