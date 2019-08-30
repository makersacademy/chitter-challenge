require 'pg'

feature 'Chitter' do
  scenario 'I can post a message (peep) to chitter' do
    visit '/new'
    fill_in('peep', with: 'Coding is fun!')
    click_button('Post')
    expect(page).to have_content('Coding is fun!')
    expect(page).to have_content(/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/)
  end
end
