require_relative 'helpers'

feature 'tags' do
  include Helpers

  before do
    sign_up(username: 'Ryan')
    post_peep(peep_content: "In fourth week of Makers Academy", tags: "education computing")
  end

  scenario 'I can post a peep with tags' do
    within ".peep" do
      expect(page).to have_content "education, computing"
    end
  end

  scenario 'I can search for peeps via tags' do
    fill_in 'search', with: '#education'
    click_on 'Search'
    expect(page).to have_content "In fourth week of Makers Academy"
  end

  scenario 'I can filter peeps by tag' do
    
  end

end
