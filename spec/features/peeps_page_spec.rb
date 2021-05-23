feature 'viewing peep feed' do 
  scenario 'list of peeps' do 
    visit '/peeps'
    expect(page). to have_content "WOW, my first peep!"
  end
end
