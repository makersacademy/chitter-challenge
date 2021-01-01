require 'pg'

feature 'add peep' do
  scenario 'maker adds a peep' do
    visit '/'
    within('form') do
      fill_in('peep', with: 'added a message!')
      fill_in('maker', with: 'new maker')
    end
    click_button('Peep')
    expect(page).to have_content('added a message!')
  end
end

