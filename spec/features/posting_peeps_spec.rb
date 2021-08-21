feature 'Posting peeps' do
  scenario 'there is a form for users to use to post peeps' do
    visit('/comment')

    expect(page).to have_css('#comment')
  end

  scenario 'user can save peep to database' do
    visit('/comment')
    fill_in('comment', with: 'Example peep')
    click_button('Submit')
    expect(page).to have_content('Example peep')
  end
end
