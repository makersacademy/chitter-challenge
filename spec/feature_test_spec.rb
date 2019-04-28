require 'spec_helper'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'using chitter' do
  scenario 'visiting the homepage' do
    visit '/'
    expect(page).to have_content "CHITTER"
    expect(page).to have_content "welcome to chitter"
  end
end

feature 'posting a peep' do
  scenario 'homepage has post button' do
    visit '/'
    expect(page).to have_button "POST"
  end
end
