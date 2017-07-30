feature 'See peep' do
  scenario 'I can see my posted peep' do
    visit '/'
    expect(page.status_code).to eq 200
    Peep.create(content: 'My first peep')
    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
    end
  end
end
