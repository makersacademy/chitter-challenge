feature 'Viewing links' do 

  scenario 'I can see existing peeps on the peeps page' do 
    Peeps.create(activity: 'Eating dinner with friends')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Eating dinner with friends')
    end
  end
end



