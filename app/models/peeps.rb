
require 'data_mapper'
 
 class Peeps
   include DataMapper::Resource

   property :id,     Serial
   property :peep,   String

 end
