require "dotenv/load"
ENV["RACK_ENV"] = ENV["MODE"]
require "./app"
run Application
