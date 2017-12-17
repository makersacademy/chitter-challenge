feature 'View peep' do

  # scenario 'see the peep on the page' do
  # Peep.create(msg: 'Hi, this is peep1')
  # visit('/peeps')
  #  expect(page.status_code).to eq 200
  # expect(page).to have_content('Hi, this is peep1')
  # end

  scenario 'see peeps in reverse chronological order' do
    peep_first
    peep_second
    expect('Hi, this is peep2').to appear_before('Hi, this is peep1')
    end

  scenario 'see the time of the peep' do
    peep_first
    time_stamp = Time.new.strftime("%A, %d %b %Y %l:%M %p")
    within 'ul#peeps' do
    expect(page).to have_content("#{time_stamp}")
    end

  end

end
feature 'Creating peeps' do

  scenario 'submission to have a form and a Create peep button' do
    visit('/peeps/new')
    expect(page).to have_button('Create peep')
  end

  scenario 'user can write a peep ' do
    peep_second
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hi, this is peep2')
    end
  end

end
