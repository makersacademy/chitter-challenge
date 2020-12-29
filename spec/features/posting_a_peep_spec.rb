feature 'post a peep' do
  scenario 'user posts a peep and sees it on peep homepage' do
    visit '/peeps'
    # THIS WILL NEED TO CHANGE TO ENABLE USERS
    click_link 'New Peep'

    expect(current_path).to eq '/peeps/new'

    fill_in 'peep[message]', with: 'My first test peep'
    click_button 'Post Peep'

    expect(page).to have_content 'My first test peep'
    expect(page).not_to have_content 'Sinatra'
  end
end
