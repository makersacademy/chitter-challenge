feature 'Viewing poops' do
  scenario 'I can see existing poops on the poops page' do
    Poop.create(poop: 'My first ever poop on sh*tter')

    visit '/poops'
    expect(page.status_code).to eq 200

    within 'ul#poops' do
      expect(page).to have_content('My first ever poop on sh*tter')
    end
  end
end
