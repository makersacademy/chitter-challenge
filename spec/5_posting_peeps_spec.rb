feature 'I can post peeps' do
  scenario "it lets me post 'Hello world!' " do
    sign_up
    login
    click_on 'Peep'
    fill_in :peep, with: 'Hello world!'
    click_on 'Peep away'
    expect(page).to have_content('Hello world!')
  end
end
