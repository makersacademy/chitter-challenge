feature 'Creating peeps' do

  scenario 'I can create a new peep if I am signed in' do
    sign_up
    visit '/peeps'
    fill_in 'text',   with: 'Hello world!'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ol#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end