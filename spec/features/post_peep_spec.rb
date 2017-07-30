# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Posting peeps' do

  scenario 'user can post peeps' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'
    fill_in 'peeps', with: 'Hello World!'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'Hello World!'
    end
  end
end
