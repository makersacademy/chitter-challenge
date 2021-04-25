require 'pg'

feature 'posting to chitter' do
  scenario 'user can post a peep to chitter' do
    visit '/'
    fill_in 'peep', with: 'Loving life #brunch' 
    click_button 'Peep'

    expect(page).to have_content 'Loving life #brunch'
  end
end
