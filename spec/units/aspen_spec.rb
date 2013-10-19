require_relative "../spec_helper"

describe Aspen do

  let(:root) {@@root_name = "my-awesome-project"}

  context 'class methods' do

    it "::make_files should create README.md and put the project name in that file" do
      root
      Aspen.make_files
      Aspen.send(:git).should 
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

  it 'relies on a recursive ::tree_gen method to convert a template into a new project directory structure' do
    pending
  end

  it 'recursively calls a #tree_gen method to map nested hashes to a directory structure' do
    AspenTemplate.should_receive(:tree_gen).exactly(2).times.and_call_original
    AspenTemplate.tree(test_hash)
  end

  context '::tree_gen' do
    it "accepts a 'root' argument that defaults to nil" do
      AspenTemplate.tree_gen(test_hash).should eq AspenTemplate.tree_gen(test_hash, nil)
    end
  end

end