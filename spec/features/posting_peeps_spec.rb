feature 'add a peep message to Chitter' do
  scenario 'A user can post a peep message to Chitter' do
    visit('/peeps/new')
    fill_in 'peep', with: "This is a peep"
    click_button('Submit peep')

    expect(page).to have_content "This is a peep"
  end
end

