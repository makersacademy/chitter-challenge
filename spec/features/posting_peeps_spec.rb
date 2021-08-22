feature 'Posting peeps' do
  scenario 'there is a form for users to use to post peeps' do
    visit('/comment')
    expect(page).to have_css('#message')
  end

  scenario 'user can save peep to database' do
    visit('/comment')
    fill_in('message', with: 'Dummy peep')
    fill_in('username', with: 'Jane')
    click_button('Submit')
    expect(page).to have_content('Dummy peep')
    expect(page).to have_content('Jane')
  end
end
