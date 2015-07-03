feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'test message'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#messages' do
      expect(page).to have_content('test message')
    end
  end

  scenario 'There are no links in the database at the start of the test' do
    expect(Peep.count).to eq(0)
  end

end