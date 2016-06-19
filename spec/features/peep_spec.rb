feature 'User can see peeps' do

  before(:each) do
    Peep.create(peep: 'beep beep beep')
    Peep.create(peep: 'peep peep peep')
  end

  scenario 'I can see existing peeps' do
    Peep.create(peep: 'beep beep beep')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('beep beep beep')
    end
  end
end
