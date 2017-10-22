feature 'Adding Peeps' do
  before do
    visit '/peeps/new'
    fill_in :peep, with: 'peep1234'
    click_button 'Submit'
  end

  scenario 'I want users to be taken to the feed once they\'ve posted a peep' do
    expect(current_path).to eq '/feed'
  end

  scenario 'I want the feed to contain the peeps' do
    expect(page).to have_content 'peep1234'
  end
end
