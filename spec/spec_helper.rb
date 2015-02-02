require 'rubygems'
require 'factory_girl'

require_relative '../semantic_network/semantic_net'
require_relative '../semantic_network/semantic_node'

RSpec.configure do |config|
	config.include FactoryGirl::Syntax::Methods
end