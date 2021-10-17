feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peeps.create(name: 'Developer Joe',peep: 'I am a Pull Stack Developer.',tags: '#programming')
    visit ('/chitter')
    expect(page).to have_content('I am a Pull Stack Developer.')

    first('.peeps').click_button 'Delete'
    expect(current_path).to eq '/chitter'
    expect(page).not_to have_content('I am a Pull Stack Developer.')
  end
end

