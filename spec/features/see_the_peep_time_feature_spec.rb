feature 'See the time of the Peep' do

  scenario "Visit the home page and post a peep and see it's peep time" do
    User.instance_variable_set(:@current_user, nil)
    visit '/'
    click_link 'SIGN UP'

    fill_in('user_name', with: 'James Ault')
    fill_in('handle', with: 'tso402')
    click_button 'Submit'
    
    fill_in('peep_text', with: 'I am the best')
    @time = Time.now.strftime('%T').to_s
    click_button 'PEEP'

    expect(page).to have_content @time

  end

end