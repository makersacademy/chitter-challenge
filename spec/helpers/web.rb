module WebHelpers

  def post_peep
    visit '/'
    fill_in('peep', with: 'Hello world')
    click_button 'Peep'
  end

end
