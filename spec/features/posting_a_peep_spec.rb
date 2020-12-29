feature 'post a peep' do
  scenario 'user posts a peep and sees it on peep homepage' do
    visit '/peeps'
    # THIS WILL NEED TO CHANGE TO ENABLE USERS
    click_button 'New Peep'

    expect(current_path).to eq '/peeps/new'

    fill_in 'Message', with: 'My first test peep'
    click_button 'Post Peep'

    expect(page).to have_content 'My first test peep'
  end
end
