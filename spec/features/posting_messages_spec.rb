feature 'posting messages to chitter' do

  text = 'Consequat ea in voluptate magna est veniam non laboris pariatur reprehenderit culpa consectetur.'

  scenario 'I can post a message to chitter when logged in' do
    sign_up
    visit '/peeps/new'
    fill_in :peep, with: text
    click_button 'Post'
    expect(page).to have_content text
  end

end