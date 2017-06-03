# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Add time to peeps: ' do
  scenario 'allows to show the time a peep was created' do
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
      expect(page).to have_content('Jun-2017')
    end
  end
end
