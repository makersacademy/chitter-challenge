feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    visit '/peeps/new'

    fill_in('text', with: 'this is a new test peep')
    click_button('submit')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('this is a new test peep')
  end
end