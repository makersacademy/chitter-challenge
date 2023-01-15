require_relative "./config/environment"
require 'rubygems'
# Models
require './app/models/peep'
require './app/models/user'
# Controllers
require './app/controllers/application_controller'
require './app/controllers/user_controller'
# Helpers
require './app/helpers/session_helper'

run ApplicationController
