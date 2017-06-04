# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
PEEPS_SELECTOR = "User"

feature 'List peeps in reverse order: ' do
  scenario 'latest added peep is listed first' do
    visit('/peeps')
    fill_in('message', with: 'I am having great fun with Ruby today!')
    click_button('Add peep')
    fill_in('message', with: 'This is a second message!')
    click_button('Add peep')
    fill_in('message', with: 'This is the third message!')
    click_button('Add peep')
    expect(current_path).to eq '/peeps'

    peep = find('ul').text.split(PEEPS_SELECTOR)
    within 'ul#peeps' do
      expect(peep[1]).to include 'This is the third message!'
    end
  end
end
