feature 'Posting Peeps' do

  scenario 'A user can post a peep and view it if logged in' do
    sign_up
    log_in
    click_link('Post a new Peep!')
    fill_in(:message, with: 'This is a peep')
    click_button('Post')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is a peep')
  end

  scenario 'A user can\'t post if not logged in' do
    visit('/peeps/new')
    expect(page).not_to have_content('This is a peep')
    expect(page).to have_content('You must be logged in to post a peep')
  end

end
