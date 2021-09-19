feature 'post peeps' do
  scenario 'a user posts a new peep' do
    visit('/peeps/new')
    fill_in('message', with: 'Hello world 10')

    click_button('Submit')

    expect(page).to have_content('Hello world 10')
  end
end
