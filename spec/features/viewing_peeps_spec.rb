feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    Peep.create(text: 'Hello, world')

    visit '/peep'
    expect(page.status_code).to eq 200

    within 'ul#peep' do
      expect(page).to have_content('Hello, world')
    end
  end
end