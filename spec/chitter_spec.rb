require_relative './lib/peep.rb'

describe App do

  feature 'user can input a peep into the homepage' do
   visit '/'
   fill_in('author'), with: 'miles'
   fill_in('new_peep'), with: 'hateful ranting'
   click_button 'Peep!'
   expect(page).to have_content('hateful ranting')
   expect(page).to have_content('miles')
  end

  

end
