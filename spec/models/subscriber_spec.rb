require 'spec_helper'

describe Subscriber do
  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should have_many(:groups).through(:subscriptions) }
  it { should validate_presence_of(:phone) }
end
