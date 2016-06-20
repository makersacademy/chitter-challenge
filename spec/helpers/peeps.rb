module Peeps

  def create_peep
    visit 'peeps/new'
    fill_in 'message', with: "CHEEP"
    click_button 'Submit peep'
  end

end
