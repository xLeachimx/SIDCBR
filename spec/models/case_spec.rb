require 'spec_helper'

describe Case do
	context 'new settings' do
		let(:net){ SemanticNet.new() }
		subject { Case.new(net) }
		let(:hero){
			{weapon: 'knife',
				job: 'cop',
				involved_with: nil
			}
		}

		it 'creates new nodes' do
			subject.setHero(hero)
			expect(net.isNode('knife')).to eq(true)
		end

		it 'does not create nil node' do
			subject.setHero(hero)
			expect(net.isNode(nil)).to eq(false)
		end
	end
end