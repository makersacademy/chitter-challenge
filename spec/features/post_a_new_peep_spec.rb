require_relative './web_helpers'

feature 'Posting a new peep' do

  scenario 'A user can post a new peep' do
    register_new_user
    click_button('post a peep')
    fill_in('text', with: 'This is a brand new peep!')
    click_button('post')

    expect(page).to have_content 'This is a brand new peep!'

  end
end
