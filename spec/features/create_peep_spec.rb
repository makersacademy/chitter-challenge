feature 'User can make add a peep' do
  scenario 'visits webpage and makes peep' do
    visit('/')
    fill_in('peep', with: 'This is my first peep!')
    click_button('PEEP')

    expect(page).to have_content 'This is my first peep!'
  end
end