feature 'Creating peeps' do

  scenario 'new peeps can be created form the page' do
    visit '/peeps/new'
    fill_in 'name', with: 'Barney'
    fill_in 'copy', with: 'Hello world'
    click_button 'Peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'Barney: Hello world'
    end
  end
end
