feature 'View peeps' do

  scenario 'View peeps on the peeps page' do
    Peep.create(message: 'A test peep')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('A test peep')
    end
  end
end
