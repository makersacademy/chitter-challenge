feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'peep_text', with: 'Hello World!'
    click_button 'Peep it!'

    expect(current_path).to eq('/peeps')

    within 'ul#peeps' do
      expect(page).to have_content('Hello World!')
    end
  end

  scenario 'I cannot create an empty Peep' do
    visit '/peeps/new'

    expect { click_button 'Peep it!' }.to_not change(Peep, :count)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Peep must not be empty')
  end

  scenario 'I cannot create a Peep longer than 100 characters' do
    visit '/peeps/new'
    fill_in 'peep_text', with: "We will not go quietly into the night!
                                We will not vanish without a fight!
                                We're going to live on!
                                We're going to survive!"

    expect { click_button 'Peep it!' }.to_not change(Peep, :count)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Peep must not be more than 100 characters')
  end
end
