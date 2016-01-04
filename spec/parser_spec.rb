require 'spec_helper'
require 'chintz/parser'

describe 'Chintz Parser' do
  before(:each) do
    @parser = Chintz::Parser.new(File.expand_path('../fixtures', __FILE__))
  end

  it 'should raise error if prepare arg is not a string or array of strings' do
    expect {@parser.prepare({})}.to raise_error(ArgumentError)
  end

  it 'should raise error if name is not defined' do
    allow(YAML).to receive(:load_file).and_return({})
    expect {@parser.prepare('foo')}.to raise_error(NameError)
  end

  it 'should return dependencies' do
    expect(@parser.prepare('robin')).to eq({'css' => ['path/to/robin.css']})
  end
end
