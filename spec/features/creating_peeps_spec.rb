require './app/models/user'

feature 'creating peeps' do

  scenario 'I can create a peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'This is a test peep'
    click_button 'Send peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is a test peep')
    end
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end
