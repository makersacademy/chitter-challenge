feature 'Add peeps' do
  scenario 'signed in user - from peeps route' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    visit '/peeps'
    fill_in 'body', with: 'My first peep'
    click_on 'Post' 

    expect(page).to have_content "My first peep" 
    expect(first('.peep')).to have_content "peterpan"
    expect(first('.peep')).to have_content "Peter Pan"
  end

  scenario 'signed in user - from navbar' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on '+ Peep'
    fill_in 'body', with: 'My first peep'
    click_on 'Post' 

    expect(page).to have_content "My first peep" 
  end

  scenario 'user is prompted to log in when they try to create a peep' do
    visit '/'
    click_on '+ Peep'

    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'You must be signed in to post a peep'
  end
end
