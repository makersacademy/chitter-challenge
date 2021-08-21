feature 'homepage' do
  scenario 'should see a homepage' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end 

feature 'textarea to peep' do
  scenario 'should see a textare to type peep' do
    visit '/'
      expect(page).to have_field 'message'
    end
end

feature 'post a message' do
  scenario 'should be able to post a peep' do 
    visit '/'
    fill_in :message, with: 'Hi, i feel happy!'
    click_button("Peep")
    expect(page).to have_content('Hi, i feel happy!')
  end 
end