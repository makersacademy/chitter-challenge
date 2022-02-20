feature 'Post a message (peep)' do
  scenario 'shows the peep I posted on the homepage' do
    visit('/peeps')
    fill_in('peep', with: 'Hello, chitter!')
    click_button('Post')
    expect(page).to have_content 'Hello, chitter!'
  end
end
