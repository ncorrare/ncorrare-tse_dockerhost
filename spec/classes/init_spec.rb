require 'spec_helper'
describe 'tse_dockerhost' do

  context 'with defaults for all parameters' do
    it { should contain_class('tse_dockerhost') }
  end
end
