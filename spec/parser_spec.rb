require 'spec_helper'
require 'parser'


describe 'Parser prepare' do
  before(:each) do
    @parser = Chintz::Parser.new
  end
  it 'should create new instance of Chintz Parser' do
    expect(@parser).to be_a Chintz::Parser
  end
  it 'should raise error if prepare arg is not a string or array of strings' do
    expect {@parser.prepare ({})}.to raise_error ArgumentError
  end
  it 'should raise error if name is not defined' do
    allow(YAML).to receive(:load_file).and_return({})
    expect {@parser.prepare 'robin'}.to raise_error NameError
  end
  it 'should return dependencies' do

    allow(YAML).to receive(:load_file).and_return(
      {"name"=>"robin", "dependencies" => {"css"=>['path/to/robin.css']}}
    )
    expect(@parser.prepare('robin')).to eq ({"css" => ["path/to/robin.css"]})
  end
end
