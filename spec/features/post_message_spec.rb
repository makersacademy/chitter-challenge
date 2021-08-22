feature 'homepage' do
  scenario 'should see a homepage' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end 

# feature 'textarea to peep' do
#   scenario 'should see a textarea to type their peep' do
#     visit '/'
#       expect(page).to have_field(type: 'textarea')
#     end
# end

feature 'post a new message' do
  scenario 'should be able to post a peep' do 
    visit '/peeps/new'
    fill_in :message, with: 'Hi, i feel happy!'
    click_button("Post Peep")
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hi, i feel happy!')
  end 
end