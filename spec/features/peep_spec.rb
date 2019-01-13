require_relative 'web_helper'

feature 'User can post a peep' do
  scenario 'Shows one peep on the page' do
    post_peep
    expect(page).to have_content 'Writing a peep'
  end
end
