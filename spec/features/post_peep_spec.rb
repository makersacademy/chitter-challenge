require_relative "../../app"
require_relative "../helper_methods"

feature "Homepage" do
  before do
    clear_table
  end
  scenario 'User navigates to Homepage' do
    visit '/'
    expect(page).to have_text "Chitter"
  end
end

feature "Posting peeps" do
  scenario "User adds a peep saying they love Makers" do
    create_account
    login
    visit '/'
    fill_in('peep_text', :with => 'I love Makers')
    click_on('Post')
    expect(page).to have_content 'I love Makers'
  end
  scenario "User can't add a peep if they're signed out" do
    visit '/'
    expect(page).not_to have_content 'post'
  end
end
