$: << File.join(File.dirname(__FILE__), "lib")
require 'bundler'

require './webapp.rb'


run WebApp
