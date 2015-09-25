require './app/models/peep'
feature 'Viewing peep' do
  scenario 'I can view peep on the screen' do
    Peep.create(content: 'TGI Friday!')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within('ul#peeps') do
      expect(page).to have_content("TGI Friday!")
    end
  end
end
