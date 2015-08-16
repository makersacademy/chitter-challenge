module PeepHelpers

  def post_a peep
    visit '/peep/new'
    fill_in 'content', with: "This is a sample peep."
    click_button 'Peep'
  end
end