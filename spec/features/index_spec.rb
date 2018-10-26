feature 'index page' do
  before do
    visit '/'
  end

  scenario 'displays the title Chitter on the page' do
    expect(page).to have_content 'Chitter'
  end

  scenario 'has a link to view the list of peeps' do
    click_button 'View all peeps'
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content 'No peeps posted yet!'
  end

  scenario 'has a link to sign up' do
    click_button 'Sign up'
    expect(page).to have_current_path '/sign_up'
  end
end
