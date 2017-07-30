feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the chitter homepage' do
    Peep.create(name: 'Regina Phalange', handle: '@left_phalange', post: 'Just finished week 4 eek!')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Regina Phalange')
    end
  end
end
