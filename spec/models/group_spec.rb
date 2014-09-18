require 'spec_helper'

describe Group do
  it { should belong_to(:user) }
  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should have_many(:subscribers).through(:subscriptions) }
  it { should have_many(:messages) }

  it { should validate_presence_of(:name) }

  describe '.ordered' do
    it 'returns alphabetically ordered groups' do
      create(:group, name: 'CE1')
      create(:group, name: 'CP')
      create(:group, name: 'CE2')

      expect(Group.ordered.pluck(:name)).to eq(%w(CE1 CE2 CP))
    end
  end
end
