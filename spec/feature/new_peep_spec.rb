require 'pry'

feature 'Posting a new peep' do
  it 'shows the new peep' do
    visit '/'
    click_button 'Add'
    fill_in(:peep, with: 'This is my first ever peep.')
    click_button 'Submit'
    expect(page.current_path).to eq('/')
    expect(page).to have_content('This is my first ever peep.')
    # expect(page).to have_content('This is my first ever peep.')
  end

  it 'shows the time of the peep' do
    visit '/'
    click_button 'Add'
    fill_in(:peep, with: 'This is my first ever peep.')
    click_button 'Submit'
    expect(page).to have_content('This is my first ever peep. | posted at #{Time.now.strftime("%I:%M on %d %B, %Y")}')
  end
end
