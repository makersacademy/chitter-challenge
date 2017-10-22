feature 'Create Peep' do
  scenario 'I want to create a peep' do
    visit '/peeps/new'
    expect(page).to have_button("Add peep")
  end

    scenario 'I want to post a peep' do
      Peep.create(message: 'Hello world')
      visit '/peeps'
      expect(page).to have_content('Hello world')
  end
end
