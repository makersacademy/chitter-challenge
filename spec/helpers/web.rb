module WebHelpers

  def post_peep(message)
    visit '/'
    fill_in('peep', with: message)
    click_button 'Peep'
  end

end
