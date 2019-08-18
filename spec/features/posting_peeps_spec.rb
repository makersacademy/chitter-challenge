require_relative 'web_helpers'

feature 'posting peeps' do
  scenario 'peeps can be added to the chitter feed' do
    sign_in
    click_button '+'
    fill_in 'Message', with: 'test peep'
    click_button 'Post'

    expect(page).to have_content 'test peep'
  end
end
