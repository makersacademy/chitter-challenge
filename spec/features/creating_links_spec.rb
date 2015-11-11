feature 'creating a new peep' do

  scenario 'i can create a new message' do
    visit 'peeps/new'
    fill_in 'Peep', with: 'Hi, this ia a test peep!!!'
    click_button 'Send peep'
    expect(current_path).to eq 'peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'Hi, this is a test peep!!!'
    end
  end
end