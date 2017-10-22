feature 'posting peeps' do

  scenario 'post a peep to Chitter' do
    visit '/'
    fill_in :user, with: 'Bella'
    fill_in :peep, with: 'Peepers gonna Peep'
    click_button 'Peep!'

    visit '/peeps/new'
    
    expect(page).to have_content 'Peepers gonna Peep'
  end
end
