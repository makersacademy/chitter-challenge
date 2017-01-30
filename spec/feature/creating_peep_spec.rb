feature 'Creating a peep' do
  scenario 'want to be able to post a peep' do

    visit '/chitters'
    fill_in 'message', with: 'Hello world'
    click_button 'Post peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello world'
  end
end
