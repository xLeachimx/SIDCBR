require 'spec_helper'

describe SemanticNode do
	context 'valid calls' do
		describe 'to semantic node constructor' do
			it 'gives the node the proper name' do
				node = SemanticNode.new('Steev')
				expect(node.name).to eq('Steev')
			end

			it 'starts out with no connections' do
				node = SemanticNode.new('Steev')
				expect(node.getConnections().length).to eq(0)
			end

			it 'starts out with no associated cases' do
				node = SemanticNode.new('Steev')
				expect(node.getAssocCases().length).to eq(0)
			end
		end

		describe 'to addConnection' do
			let(:subject){ SemanticNode.new('Steev') }
			let(:connectTo){ SemanticNode.new('Todd') }

			it 'returns true if successful' do
				expect(subject.addConnection(connectTo,'isa')).to eq(true)
			end

			it 'adds a connection' do
				subject.addConnection(connectTo,'isa')
				expect(subject.getConnections().length).to eq(1)
			end

			context 'adds the appropriate connection' do
				it 'with the right type' do
					subject.addConnection(connectTo.clone(),'isa');
					expect(subject.getConnections()[0][0]).to eq('isa')
				end

				it 'with the right clone' do
					subject.addConnection(connectTo,'isa');
					expect(subject.getConnections()[0][1]).to equal(connectTo)
				end
			end

			it 'rejects a non-valid connection type' do
				subject.addConnection(connectTo,'is')
				expect(subject.getConnections().length).to eq(0)
			end
		end
	end
end