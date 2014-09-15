require 'spec_helper'

describe Group do
  it { should belong_to(:user) }
  it { should validate_presence_of(:class_name) }
end
