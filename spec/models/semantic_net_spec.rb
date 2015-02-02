require 'spec_helper'

describe SemanticNet do
	context 'valid calls' do
		let(:subject){ SemanticNet.new() }
		describe 'on SemanticNet constructor' do
			it 'has no nodes' do
				expect(subject.nodes.length).to eq(0)
			end
		end

		describe 'to node method' do
			let(:steev){ 'steev' }
			let(:human){ 'human' }
			describe 'addNode' do
				it 'adds a node to the net' do
					subject.addNode(steev)
					expect(subject.nodes.length).to eq(1)
				end

				it 'adds the proper node to the net' do
					subject.addNode(steev)
					expect(subject.nodes.last.name).to eq(steev)
				end
			end

			describe 'addConnection' do
				before(:each) do
					subject.addNode(steev)
					subject.addNode(human)
					subject.addConnection(steev,human,'isa')
				end

				it 'establishes a connection on steevs side' do
					expect(subject.getNode(steev).getConnections.length).to eq(1)
				end

				it 'does not establish a connection on the human side' do
					expect(subject.getNode(human).getConnections.length).to eq(0)
				end

				it 'establishes a connection of the right type' do
					expect(subject.getNode(steev).getConnections[0][0]).to eq('isa')
				end
			end

			describe 'getNode' do
				it 'retrieves the proper node' do
					subject.addNode(human)
					subject.addNode(steev)
					expect(subject.getNode(steev).name).to eq(steev)
				end
			end
		end
	end
end