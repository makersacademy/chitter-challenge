# require 'peep'

feature 'post message' do
  scenario 'post message' do
    visit '/peep'
    fill_in('post', with: 'This is my first peep.')
    click_button('Peep')
    expect(page).to have_content 'This is my first peep.'
  end
end
