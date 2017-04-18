feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'One amazing peep coming right up'
    click_button 'Post peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('One amazing peep coming right up')
  end
end
