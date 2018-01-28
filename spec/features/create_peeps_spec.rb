feature 'Create peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message',   with: 'my first new peep'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('my first new peep')
  end

  scenario 'peeps appears in reverse chronological order' do
    visit '/peeps/new'
    fill_in 'message',   with: 'my first new peep'
    click_button 'Create peep'

    visit '/peeps/new'
    fill_in 'message',   with: 'my second new peep'
    click_button 'Create peep'

    expect('my second new peep').to appear_before 'my first new peep'
  end

  scenario 'I can see the time at which the peep was made' do
    visit '/peeps/new'
    fill_in 'message',   with: 'my first new peep'
    click_button 'Create peep'
    timestamp = Time.new.strftime("%d/%m/%y at %I:%M%p")
    expect(page).to have_content "#{timestamp}"
  end


end
