feature 'create peep as user' do
  scenario 'can create a peep as a user after signing up' do
    sign_up
    click_link('Create new peep')
    post_peep

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Posted by exampleusername')
  end

  scenario 'cannot post peep if not logged in' do
    visit('/')
    visit('/peeps/new')

    expect(current_path).to eq('/users/login')
    expect(page).to have_content('You must be logged in before you can post a peep.')
  end
end
