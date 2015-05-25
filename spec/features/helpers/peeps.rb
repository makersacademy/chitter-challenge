module PeepsHelpers

  def post_peep(content='This is a test peep')
    visit '/peeps/new'
    fill_in :peep_text, with: content
    click_button 'Peep'
  end

end
