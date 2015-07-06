require './app/models/peep.rb'
feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(peep: 'This is a test peep')
    visit '/peep'
    expect(page.status_code).to eq 200

    within 'ul#peep' do
      expect(page).to have_content('This is a test peep')
    end
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end
