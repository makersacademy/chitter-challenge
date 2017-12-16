feature 'View Homepage' do
  scenario 'should display a peep' do
    Peep.create(title: 'First peep', content: 'Excited to post my first peep')
    visit('/peeps')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Excited to post my first peep')
    end
  end
end
