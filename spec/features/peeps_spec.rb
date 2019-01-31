feature 'Viewing peeps' do 
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
  scenario 'viewing peeps' do
    visit('/')
    click_button('see peeps')

    expect(page).to have_content "HELLO"
    expect(page).to have_content "This is my second peep"
  end
end

feature 'Adding new peeps' do
  scenario 'A user can add a new peep to Chitter' do
    visit ('/')
    click_button('see peeps')
    click_button('add new peep')
    fill_in "new_peep", :with => 'Third peep'
    click_button 'add'
    expect(page).to have_content 'Third peep'
  end

  scenario 'Peeps should be in reverse chronological order' do
    visit('/')
    click_button('see peeps')
    click_button('add new peep')
    fill_in "new_peep", :with => 'Third peep'
    click_button 'add'
    within(first('.peep')) do
      expect(page).to have_content 'Third peep'
    end
  end    
end
