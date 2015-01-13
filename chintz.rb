require 'sinatra'
require 'mustache'

class Chintz < Sinatra::Base

  get '/hello' do
    data = {:num_of_cats => 2}
    Mustache.render("Hello {{ num_of_cats }} cats", data);
  end

end
