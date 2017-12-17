require './app/app'

feature 'posting a peep on chitter' do

  scenario 'I can post a message and it shows up in the feed' do
    sign_up
    fill_in('peep', with: 'Rest in peace Lil Peep')
    click_button('post')
    expect(page).to have_content('Rest in peace Lil Peep')
  end
end
