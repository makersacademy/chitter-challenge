feature 'Adding a peep' do

  before do
    sign_up_and_visit
    fill_in('content', with: "peep peep, I'm in me mum's car")
    click_button('Share')
  end

  scenario 'Shows it on the home page' do
    expect(page.status_code).to eq 200
    expect(page).to have_content("peep peep, I'm in me mum's car")
  end

  scenario 'lists peeps by reverse chronological order' do
    fill_in('content', with: "I'm no longer in me mum's car")
    click_button('Share')
    expect(page.status_code).to eq 200
    expect(page.body.index("I'm no longer in me mum's car")).to be < page.body.index("peep peep, I'm in me mum's car")
  end

  scenario 'shows the date and time posted' do
    current_time = Time.now.strftime("%d/%m/%Y %H:%M")
    created_id = Peep.all.reverse.map { |peep| peep.id }.max
    within('.peep_' + created_id.to_s) do
      expect(page).to have_content(current_time)
    end
  end

end
