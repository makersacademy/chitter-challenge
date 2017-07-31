feature 'FEATURE: Posting peeps' do
  include Helpers

  before do
    sign_up
  end
  
  scenario 'posting a new peep' do
    post_peep("trolltrolltroll")
    expect(page).to have_content "trolltrolltroll"
  end
end
