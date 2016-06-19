#As a Maker
#So that I can let people know what I am doing
#I want to post a message (peep) to chitter
feature 'Creating peeps' do
  scenario 'I can create new peeps' do
    visit 'peeps/new'
    fill_in 'text', with: 'howdy!'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('howdy')
  end
end
