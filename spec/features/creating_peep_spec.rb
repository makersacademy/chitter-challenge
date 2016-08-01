feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    sign_up
    sign_in
    visit '/peeps/new'
    fill_in 'peep',   with: 'This is an exciting test'
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('This is an exciting test')
    end
  end

  scenario "I can't create a peep without being logged in" do
    visit '/peeps/new'
    expect(page).to have_content 'Hi, please sign up or login to leave a peep'
  end
end
