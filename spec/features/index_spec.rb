RSpec.feature 'testing' do
  scenario 'user visits the homepage' do
    visit '/'
    fill_in 'new-peep', with: 'this is my first peep!'
    click_on 'Send Peep'

    expect(page).to have_content 'this is my first peep!'
  end
end
