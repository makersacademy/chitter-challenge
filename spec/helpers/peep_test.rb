module PeepTestHelpers
  def peep(content)
    visit '/peeps/new'
    fill_in 'content', with: content
    click_button 'Peep!'
  end
end
