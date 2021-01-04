feature 'post a peep' do
  scenario 'user can enter a new peep into chitter' do
    visit('/peeps/new')
    fill_in('content',with: 'test content')
    click_button('Submit')

    expect(page).to have_text('test content')
  end
end
