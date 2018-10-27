feature 'signing up to chitter' do
  scenario 'should have fields for email, password, name, and username' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_css("input[type='text'][placeholder='albob@gmail.com']")
    expect(page).to have_css("input[type='text'][placeholder='password']")
    expect(page).to have_css("input[type='text'][placeholder='Alice Bobson']")
    expect(page).to have_css("input[type='text'][placeholder='albob123']")
  end

  scenario 'submitting should show peeps page with user-specific greeting' do
    sign_up_as_alice_bobson
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content 'Hello albob123'
  end

  scenario 'should be able to see peep entry field if signed up' do
    peep_entry_field = "input[type='text'][placeholder='Peep away, albob123!']"
    visit '/'
    click_button 'View all peeps'
    expect(page).not_to have_css(peep_entry_field)
    sign_up_as_alice_bobson
    expect(page).to have_css(peep_entry_field)
  end
end
