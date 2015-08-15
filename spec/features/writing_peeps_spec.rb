feature 'writing peeps' do

  scenario 'I can write a new peep' do
    visit '/peeps/new'
    fill_in 'user',   with: 'chrisalcockdev'
    fill_in 'content', with: 'hello world!'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('chrisalcockdev')
    end
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end
