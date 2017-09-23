feature 'peeps creation' do
  scenario 'Users are able to post a peep (message)' do
    visit '/peeps/new'
    fill_in 'message', with: 'Setting up Chitter. This is my first peep.'
    click_button 'Post'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Setting up Chitter. This is my first peep.')
    end
  end
end
