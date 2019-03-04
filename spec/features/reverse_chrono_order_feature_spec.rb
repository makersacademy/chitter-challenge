feature 'See a list of peeps in reverse order Peep' do
  scenario 'Visit the home page and post two peeps and see them in reverse chrono order' do
    User.instance_variable_set(:@current_user, nil)
    visit '/'
    click_link 'SIGN UP'

    fill_in('user_name', with: 'James Ault')
    fill_in('handle', with: 'tso402')
    click_button 'Submit'

    fill_in('peep_text', with: 'I am the best')

    click_button 'PEEP'

    fill_in('peep_text', with: 'I am not the best')

    click_button 'PEEP'

    expect(page).to have_content "I am not the best"

    expect(page).to have_content "James Ault"
    expect(page).to have_content "tso402"
    expect(page).to have_content "I am the best"
  end

end