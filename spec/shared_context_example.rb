require 'shared_stuff.rb'

describe "group that includes a shared context using 'include_context'" do
  include_context 'shared stuff'

  it 'has access to methods defined in shared context' do
    expect(shared_method).to eq('it works')
  end

  it 'has access to methods defined with let in shared context' do
    expect(shared_let['arbitrary']).to eq('object')
  end

  it 'runs the before hooks defined in the shared context' do
    expect(@some_var).to be(:some_value)
  end

  it 'accesses the subject defined in the shared context' do
    expect(subject).to eq('this is the subject')
  end

  group = self
  p group
  #p group.metadata

  it 'inherits metadata from the included context' do |ex|
    expect(group.metadata).to include(:shared_context => :metadata)
    p ex
    #p ex.metadata
    expect(ex.metadata).to include(:shared_context => :metadata)
  end
end

describe "including shared context using 'include_context' and a block" do
  include_context "shared stuff" do
    let(:shared_let) { {'in_a' => 'block'} }
  end

  it 'evaluates the block in the shared context' do
    expect(shared_let['in_a']).to eq('block')
  end
end

describe 'group that includes a shared context using metadata', :include_shared => true do
  it 'has access to methods defined in shared context' do
    expect(shared_method).to eq('it works')
  end

  it 'has access to methods defined with let in shared context' do
    expect(shared_let['arbitrary']).to eq('object')
  end

  it 'runs the before hooks defined in the shared context' do
    expect(@some_var).to be(:some_value)
  end

  it 'accesses the subject defined in the shared context' do
    expect(subject).to eq('this is the subject')
  end

  group = self

  it 'inherits metadata from the included context' do |ex|
    expect(group.metadata).to include(:shared_context => :metadata)
    expect(ex.metadata).to include(:shared_context => :metadata)
  end
end

describe 'group that does not include the shared context' do
  it 'does not have access to shared methods normally' do
    expect(self).not_to respond_to(:shared_method)
  end

  it 'has access to shared methods from examples with matching metadata', :include_shared => true do
    expect(shared_method).to eq('it works')
  end

  it 'inherits metadata form the included context due to the matching metadata', :include_shared => true do |ex|
    expect(ex.metadata).to include(:shared_context => :metadata)
  end
end
