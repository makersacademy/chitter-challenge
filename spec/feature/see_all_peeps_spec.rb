# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'See all Peeps' do 
  scenario '-User sees all Peeps in reverse chronological order' do
    Peeps.new('Oldest Message')
    Peeps.new('Newest Message')

    visit ('/peeps')

    save_and_open_page
    
    #The :nth-child(n) selector matches every element that is the nth child of its parent
    expect(page.find('li:nth-child(1)')).to have_content('Newest Message')
    expect(page).to have_content('Oldest Message')
  end
end
