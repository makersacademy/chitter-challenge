feature 'Posting a new peep' do
  it 'shows the new peep' do
    visit '/'
    click_button 'Add'
    fill_in(:peep, with:'This is my first ever peep.')
    click_button 'Post'
    expect(page).to have_content('This is my first ever peep.')
    expect(current_path).to eq '/'
  end
end
