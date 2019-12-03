feature 'homepage' do

  scenario 'a user can visit the homepage and see content' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "Sign up or login below."
  end

  scenario 'a user can see peep form and submit button' do
    visit '/'
    expect(page).to have_field('enter peep')
    expect(page).to have_selector(:link_or_button, 'Peep')
  end

  scenario 'a user can fill in form with a peep that becomes visible on page' do
    visit '/'
    fill_in('enter peep', with: 'My first peep!')
    click_button('Peep')
    expect(page).to have_content 'My first peep!'
  end

  scenario 'a user can click the Newbie button' do
    visit '/'
    within(:css, '#button_1') do
    click_button 'Newbie'
    # save_and_open_page
    end
  end

  scenario 'a user can click the Member button' do
    visit '/'
    within(:css, '#button_2') do
      click_button 'Member'
    end
  end

end
