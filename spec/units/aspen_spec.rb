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

describe AspenTemplate do

  let(:test_hash) { 
                    {
                      :bin => {},
                      :config => {},
                      :lib => {
                        :models => {},
                        :concerns => {}
                      }
                    }
                  }


  it 'has a method that converts a nested hash into an array' do
    AspenTemplate.tree(test_hash).should be_a(Array)
  end

  context '::treegen' do
    it '' do

    end
  end

end