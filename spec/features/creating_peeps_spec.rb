feature 'Posting a peep' do
  scenario 'User can post a peep to Chitter' do
    visit('/')
    fill_in('peep', with: "It's a sunny day!")
    click_button('Peep!')

    expect(page).to have_content "It's a sunny day!"
  end
end
