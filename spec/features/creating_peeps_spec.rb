feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'text',   with: 'Hello world!'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ol#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end
end