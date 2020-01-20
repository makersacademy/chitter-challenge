feature 'Home page of Chitter' do 
  scenario 'Has a button to take you to all of the tweets' do 
    visit('/home')
    click_button 'See All Peeps' 
    expect(current_path).to eq '/all_peeps'
  end 
end 
