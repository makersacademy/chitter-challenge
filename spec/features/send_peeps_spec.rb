feature 'Sending a Peep' do
  scenario 'user can send a peep and see it' do
    visit '/'
    click_on 'Compose Peep'
    fill_in 'content', with: 'This is a test peep'

    expect(page).to have_content 'This is a test peep'
  end
end