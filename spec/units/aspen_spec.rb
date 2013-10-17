require_relative "../spec_helper"

describe Aspen do

  context 'has a basic command line interface' do

    it 'responds to a method :run' do
      Aspen.should respond_to(:run)
    end

    it 'can respond to a help method' do
      Aspen.should respond_to(:help)
    end

  end

end