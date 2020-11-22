require_relative '../../app/app'

feature "Posting a new peep" do
  scenario 'A Maker can post a new peep in Chitter' do
    visit '/peeps/new'
    fill_in('peep', with: 'This is a test peep!')
    click_button('Post')

    expect(page).to have_content('This is a test peep!')
  end
end