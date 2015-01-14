require 'sinatra'
require './lib/parser.rb'
require './lib/fixture.rb'

class WebApp < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "chintz") }

  get '/' do
    parser = Chintz::Parser.new
    parser.prepare ['mediaObject', 'elementA']
    @css = parser.dependency 'css'
    @content = ''
    @content << parser.render('mediaObject', Chintz::Fixture.load_plain_yaml('stories'))
    @content << parser.render('elementA', Chintz::Fixture.load_plain_yaml('people'))
    erb :index
  end

end
