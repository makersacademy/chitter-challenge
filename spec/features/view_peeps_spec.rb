feature 'viewing peeps' do

  scenario 'user can see existing peeps' do
    Peep.create(peep: 'Despite the constant negative press covfefe')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Despite the constant negative press covfefe')
    end
  end

end
