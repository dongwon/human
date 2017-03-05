require 'spec_helper'

describe User do
  it 'can be doubled' do
    instance_double("User", :name => "Don")
  end
end
