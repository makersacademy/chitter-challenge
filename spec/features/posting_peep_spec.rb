RSpec.feature 'Posting peep' do
  scenario 'user signs up and posts a peep' do
    visit '/register'
    fill_in('username', with: 'Peeper')
    find_button('Start Peeping').click
  end
end