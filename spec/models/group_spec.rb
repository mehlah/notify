require 'spec_helper'

describe Group do
  it { should belong_to(:user) }
  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should have_many(:subscribers).through(:subscriptions) }
  it { should have_many(:messages) }

  it { should validate_presence_of(:class_name) }
end
