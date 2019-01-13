def send_peep  
  visit '/'
  fill_in :message, with: 'One man must peep'
  click_on 'Submit'
end
