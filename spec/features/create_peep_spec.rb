feature 'posting messages to chitter' do

  scenario 'user can post a message to chitter' do
    text = 'OMG'
    visit '/peeps/new'
    fill_in :peep, with: text
    fill_in :handle, with: '#alice'
    fill_in :name, with: 'alice'
    click_button 'Post'
    visit '/peeps'
    expect(page).to have_content text
  end

end
