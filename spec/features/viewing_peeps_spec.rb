require_relative '../../app/data_mapper_setup'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peep feed' do
    Peep.create(message: 'test', time: Time.now)
    visit '/feed'
    expect(page.status_code).to eq 200
    within 'ul#feed' do
      expect(page).to have_content('test')
    end
  end

end
