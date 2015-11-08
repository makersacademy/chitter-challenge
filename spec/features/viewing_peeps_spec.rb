feature 'Viewing links' do

  scenario 'I can see existing peeps on the peep_list page' do
    Peep.create(text: 'Hello, world')

    visit '/peep'
    expect(page.status_code).to eq 200

    within 'ul#peep' do
      expect(page).to have_content('Hello, world')
    end
  end
end