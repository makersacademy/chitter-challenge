feature 'User can create a peep' do
  scenario 'Add a message (peep) to chitter' do
    # visit('/')
    # fill_in 'body_post' , with: 'Hello world!'
    # click_button 'Peep'
    # expect(page).to have_content('Hello world')
    Peep.create(body_post: 'Hello world!')
    visit('/posts')
    expect(page.status_code).to eq 200
    within 'ul#posts' do
    expect(page).to have_content('Hello world!')
    end
  end
end
