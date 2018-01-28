feature 'Posting peeps' do
  scenario 'I want to post a message (peep) to chitter' do
    visit '/peeps/new'
    fill_in :peep, with: 'Hello world!'
    click_button 'Post'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end
end
