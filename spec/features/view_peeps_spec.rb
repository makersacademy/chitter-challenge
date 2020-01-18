feature 'View Peeps' do
  scenario 'User can view all peeps' do
    sign_up
    post_peep
    visit '/'
    click_link 'View Peeps'
    expect(page).to have_content 'My first peep'
  end

  scenario 'User can see the time the peep was posted' do
    sign_up
    post_peep
    visit '/'
    click_link 'View Peeps'
    page.find('#time', :visible => true)
  end

  scenario 'Peeps show username of user who posted it' do
    sign_up
    post_peep
    visit '/'
    click_link 'View Peeps'
    expect(page).to have_content "username1"
  end
end