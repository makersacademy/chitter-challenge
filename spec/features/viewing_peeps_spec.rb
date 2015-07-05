feature 'Viewing links' do 

  scenario 'I can see existing peeps on the peeps page' do 
    Peeps.create(activity: 'Eating dinner with friends')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Eating dinner with friends')
    end
  end

  scenario 'I can see peeps with a time stamp' do 
    
    Peeps.create(activity: 'Eating dinner with friends', created_at: '2015-07-05T22:22:08+01:00')
    visit '/peeps'
    expect(page).to have_content('2015-07-05T22:22:08+01:00')
    
  end



end



