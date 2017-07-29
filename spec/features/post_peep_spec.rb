feature 'posting a peep to chitter' do
  scenario 'new message' do
    visit '/peeps/new'
    fill_in 'content', with: 'Hello chitter!'
    click_button 'Submit'
    expect(Peep.all.count).to eq 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello chitter!'
  end
end
