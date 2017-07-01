feature 'new peep' do
  scenario 'I can add a new peep' do
    visit '/peeps/index'
    fill_in('content', with: 'Happy it\'s saturday')
    expect { click_button('Peep') }.to change { Peep.count }.by(1)
  end
end
