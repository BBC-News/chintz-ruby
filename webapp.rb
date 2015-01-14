require 'sinatra'
require './lib/parser.rb'

class WebApp < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "chintz") }
  get '/' do
    parser = Chintz::Parser.new
    parser.prepare 'elementA'
    @css =  parser.dependency 'css'
    @content = parser.render('elementA', {
      "title" => "This is the root template!",
      "items" => [0,1],
      "subtitle" => "A child partial",
      "name" => "Jack",
      "occupation" => "Nurse"
    })
    erb :index
  end

end
