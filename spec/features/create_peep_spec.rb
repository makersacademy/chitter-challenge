feature 'posting a peep' do
  scenario 'user can post a new peep' do
    visit('/')
    fill_in('content', with: 'Hello, world')
    click_on 'Submit'
    expect(page).to have_content('Hello, world')
  end
end
