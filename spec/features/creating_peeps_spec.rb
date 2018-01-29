feature 'Creating peeps' do

  scenario 'The user can create a new peep' do
    visit '/peep/new'
    fill_in 'message', with: 'I love Chitter!'
    click_button 'Submit'
    expect(current_path).to eq '/peep/all'
    expect(page).to have_content 'I love Chitter!'
  end

end
