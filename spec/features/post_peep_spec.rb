feature 'Posting a peep' do
  scenario 'user posts a peep; it appears on the page' do
    visit '/'
    fill_in('content', with: 'My first peep!')
    click_on 'Peep'

    expect(page).to have_content('My first peep!')
  end
end
