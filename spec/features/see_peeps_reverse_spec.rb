feature 'See peeps' do
  scenario 'A user can see peeps they posted in reverse order' do
    visit '/peeps/new'
    fill_in('message',with: 'Latest peep')
    click_button('Submit')

    expect(first('#message')).to have_content "Latest peep"
  end
end
