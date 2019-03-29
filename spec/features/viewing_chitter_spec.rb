feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(current_path).to eq "/chitter"
  end

  scenario 'a user can see peeps' do
    visit('/')
    expect(page).to have_content "peep_1"
    expect(page).to have_content "peep_2"
    expect(page).to have_content "peep_3"
  end
end
