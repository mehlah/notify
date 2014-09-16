require 'spec_helper'

describe Subscription do
  it { should belong_to(:group) }
  it { should belong_to(:subscriber) }
end
