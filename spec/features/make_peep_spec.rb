feature 'User can make add a peep' do
  scenario 'visits webpage and makes peep' do
    visit('/')
    fill_in('peep', with: 'Hi everyone this is my first peep!')
    click_button('Peep')

    expect(page).to have_content 'Hi everyone this is my first peep!'
  end
end