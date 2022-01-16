feature 'Adding a peep' do
  scenario 'User writes peep and sends it' do
    visit '/peeps/new'
    fill_in "message", with: 'This is my first peep'
    click_on 'Send'

    expect(page).to have_content('This is my first peep')
  end
end
