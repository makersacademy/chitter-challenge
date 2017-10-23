feature 'posting messages to chitter' do

  scenario 'user can post a message to chitter' do
    visit '/peep/new'
    fill_in :text, with: 'OMG'
    fill_in :username, with: '#alice'
    fill_in :name, with: 'alice'
    click_button 'Post'
    visit '/peeps'
    expect(page).to have_content 'OMG'
  end

end
