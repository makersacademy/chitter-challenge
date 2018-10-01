good things
good coverage 99+
covers user stories
clear code - easy to read
separate databases for testing and production - good idea to make separate file

@peeps = Peep.all(:order => [:peep_time.desc]) - made good use of datamapper functions

things you can add
add some edge tests (for logging in etc.)
move some logic away from erb, like strftime
move some logic away from controller (maybe?)
use iterators in erb to reduce repetition
@user = User.class_variable_get(:@@current_user) - you can save class variable to a method
