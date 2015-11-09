# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'View all peeps in reverse chronological order' do
  before do
    sign_up
    log_in
    peep
  end

  # As a user
  # So that I can see what others are saying
  # I want to see all peeps without the need for logging in
  scenario 'I want to see peeps without logging in' do
    log_out
    visit '/feeds/view'
    within('div .feeds') do
      expect(page).to have_content('My first peep')
    end
  end

  # As a user
  # So that I can be sure that peeps are placed in reverse order
  # I want to see my last peep at the top
  scenario 'I post two peeps and see the last one first' do
    peep(message: 'My second peep')
    within('div .feeds', match: :first) do
      expect(page).to have_content('My second peep')
    end
  end
end 
