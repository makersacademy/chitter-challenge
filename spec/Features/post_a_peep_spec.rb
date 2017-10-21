# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting Peeps' do
  scenario 'I can post a Peep' do
    visit 'peeps/new'
    fill_in 'name',   with: 'Tim'
    fill_in 'username', with: 'timjones10'
    fill_in 'message', with: 'This is my second peep!!'
    click_button "Post my Peep!"

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is my second peep!!')
    end
  end
end
