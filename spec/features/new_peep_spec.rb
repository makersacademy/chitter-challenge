feature 'Create peep' do
  before(:each) do
    visit('/users/new')
    fill_in 'user_name', with: 'Test'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'example'
    click_button('submit')
  end

  scenario 'can display peep creation form' do
    visit('/peeps/new')
    expect(page).to have_field('content', type: 'text')
    expect(page).to have_button('submit')
  end
  scenario 'can display new peep' do
    visit('/peeps/new')
    fill_in 'content', with: 'Lalalala!!'
    click_button('submit')
    expect(page).to have_content 'Author: Test'
    expect(page).to have_content 'Content: Lalalala!!'
  end
end
