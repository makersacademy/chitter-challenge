feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps feed page' do
    Peep.new(user: 'Code_Hero', peeps: 'First peep on chitter')
    visit '/peeps'
    expect(page.statys_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('First peep on chitter')
    end
  end

end