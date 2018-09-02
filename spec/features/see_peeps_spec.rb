feature "see peeps" do

  before do
    Peep.create('first peep')
    Peep.create('second peep')
    Peep.create('third peep')
  end

  scenario "see peeps" do
    visit '/feed'
    expect(page).to have_content 'first peep'
    expect(page).to have_content 'second peep'
    expect(page).to have_content 'third peep'
  end

  scenario "see peeps in reverse order" do

  end

end
