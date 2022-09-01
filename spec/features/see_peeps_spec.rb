# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'seeing peeps' do 
  scenario 'user visits the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'seeing peep feed' do
  scenario 'user can see the peep feed' do
    visit('/peeps')
    expect(page).to have_content "currently eating chocolate"
    expect(page).to have_content "en route the O2 Arena!!"
    expect(page).to have_content ""