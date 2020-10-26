require_relative '../models/peep'

def add_peeps
  Peep.create(message: 'This is my first peep!', creator: 'USER_1')
  Peep.create(message: 'This is my second peep!', creator: 'USER_2')
  Peep.create(message: 'This is my third peep!', creator: 'USER_3')
end

def parsed_time_now
  time = DateTime.now
  time.strftime('%d/%m/%Y %I:%M %p')
end

def sign_in_and_peep
  visit '/'
  fill_in(:username, with:"Peepz4Dayz")
  click_button 'Sign In'

  fill_in(:message, with: "THE BEST PEEP EVER!")
  click_button 'Peep It!'
end
