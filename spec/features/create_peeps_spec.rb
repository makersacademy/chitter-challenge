feature "Adding a new peep" do
  scenario 'A user can add a new peep to chitter' do 
    visit('/chitter/new')
    fill_in('peeps', with: 'Peep 4')
    click_button('Submit')

    expect(page).to have_content 'Peep 4'
  end
end

    

