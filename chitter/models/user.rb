class User < ActiveRecord::Base
    has_many :peeps
end