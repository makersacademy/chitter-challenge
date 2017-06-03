# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'save a message to my peeps list: ' do
  scenario 'add a message(peep)' do
    visit('/peeps')
    fill_in('message', with: 'I am having great fun with Ruby today!')
    click_button('Add peep')
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('I am having great fun with Ruby today!')
    end
  end
end
