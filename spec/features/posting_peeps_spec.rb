feature 'Posting peeps' do
  scenario 'there is a form for users to use to post peeps' do
    visit('/comment')
    expect(page).to have_css('#message')
  end

  scenario 'user can save peep to database' do
    visit('/')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'Password123')
    fill_in('name', with: 'Wash')
    fill_in('username', with: 'Leafonthewind')
    click_button('Submit')
    click_button('Go')
    fill_in('message', with: 'Dummy peep')
    click_button('Submit')
    expect(page).to have_content('Dummy peep')
    expect(page).to have_content('Leafonthewind')
  end
end
