feature 'Posting a message' do
  scenario 'allows user to post a peep' do
    visit('/peeps/add_peep')
    fill_in('message', with: 'create peep test')
    click_button 'Post to chitter'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'create peep test'
  end
end
