feature 'Sign up' do
  scenario '-signing up' do
    visit('/chitter')
    fill_in('name', with: 'Sarah')
    click_button 'Sign up'
    fill_in('peep', with: 'It me')
    click_button 'Submit'
    expect(page).to have_content('Sarah')
  end
end
