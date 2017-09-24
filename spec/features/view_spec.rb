feature 'view' do
  let(:timestamp) { double :timestamp}
  scenario 'so that I can see peeps in reverse chronological order' do
    visit ('/peep')
    fill_in 'peep', with: "latest"
    click_button 'Submit'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'latest'
    #update, shit test and doesn't confirm that this is the first entry yet
  end
  scenario 'so that I can see times that tweet were submitted' do
    visit ('/peep')
    fill_in 'peep', with: "latest"
    click_button 'Submit'
    expect(page.status_code).to eq 200
    expect(page).to have_content (:timestamp)
  end
end
