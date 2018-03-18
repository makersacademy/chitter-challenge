feature 'Posting peeps' do
  scenario 'User can post a peep' do
    visit '/peeps'
    fill_in('content', with: 'my third peep!')
    click_button('Peep!')
    expect(page).to have_content 'my third peep!'
  end

  scenario 'User tries to post an empty peep' do
    visit '/peeps'
    fill_in('content', with: '')
    click_button('Peep')
    expect(page).to have_content "It ain't fun if you don't type at least one"
  end
end
