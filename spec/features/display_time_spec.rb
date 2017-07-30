feature 'time of peep is displayed' do
  scenario 'user can see the time that their peep was created' do
    visit('/peeps')
    click_button 'Write a Peep'
    fill_in :message, with: 'My first peep'
    click_button 'Post Peep'
    within 'ul#peeps' do
    expect(page).to have_content '2017'
    end
  end
end
