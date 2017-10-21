feature 'posting messages to chitter' do

  text = 'Consequat ea in voluptate magna est veniam non laboris pariatur reprehenderit culpa consectetur.'

  scenario 'I can post a message to chitter when logged in' do
    sign_up
    visit '/peeps/new'
    fill_in :peep, with: text
    click_button 'Post'
    expect(page).to have_content text
  end
  scenario 'I cannot post a message to Chitter unless logged in' do
    error = 'You must be logged in to post a new peep'
    visit '/peeps/new'
    expect(page).to have_content error
  end
  scenario 'peeps show the user name and handle of the poster' do
    sign_up
    visit '/peeps/new'
    fill_in :peep, with: text
    click_button 'Post'
    within '.peep_box' do
      expect(page).to have_content text
      expect(page).to have_content 'Ainsley'
      expect(page).to have_content 'ainsleybc'
    end
  end

end