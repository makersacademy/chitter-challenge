require_relative "../../app"
require_relative "../helper_methods"

feature "Registration" do
  before do
    clear_table
  end
  scenario 'A user can sign up for Chitter' do
    visit '/'
    click_on 'Create Account'
    fill_in('name', :with => 'Caesar')
    fill_in('email', :with => 'caesar@conures.com')
    fill_in('password', :with => 'parrots1')
    click_on 'go'
    expect(page).to have_text "Welcome, Caesar"
  end
end

feature "Posting peeps" do
  scenario "User adds a peep saying they love Makers" do
    login
    fill_in('peep_text', :with => 'I love Makers')
    click_on('Post')
    expect(page).to have_content 'I love Makers'
  end
end
