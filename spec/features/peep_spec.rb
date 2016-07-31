feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the chitter feed page' do
    Peep.create(text: 'This is a peep - hello world',
                created_at: Time.now.strftime("%d/%m/%Y %H:%M"))
    Peep.create(text: 'This is a another peep - goodbye world',
                created_at: Time.now.strftime("%d/%m/%Y %H:%M"))

    visit '/peeps/feed'

    expect(page.status_code).to eq 200

    within 'ul#peep' do
      expect(page).to have_content("This is a another peep - goodbye world")
    end
  end
end
