module PeepHelpers 

 def post(peep)
    visit'/peeps/new'
    fill_in :peep, with: peep.message
    click_button 'Post'
 end

end