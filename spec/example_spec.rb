class Database
  def self.transaction
    puts 'open transaction'
    p ""
    yield
    puts 'close transaction'
    p ""
  end
end

describe 'around filter' do
  around(:example) do |example|
    Database.transaction(&example)
  end

  it 'gets run in order' do
    puts 'run the example'
    p ""
  end
end

describe 'around hook' do
  around(:example) do |example|
    puts 'around example before'
    example.run
    puts 'around example after'
  end

  it 'gets run in order' do
    puts 'in the example'
  end
end

describe 'something' do
  around(:example) do |example|
    puts example.metadata[:foo]
    example.run
  end

  it 'does something', :foo => 'this should show up in the output' do
  end
end

describe 'something1' do
  around(:example) do |example|
    puts 'around example setup'
    example.run
    puts 'around example cleanup'
  end

  it 'still executes the entire around hook' do
    #fail 'the example blows up'
  end
end

#RSpec.configure do |c|
#  c.around(:example) do |example|
#    puts 'around example before'
#    example.run
#    puts 'around example after'
#  end
#end

describe 'around filter' do
  it 'gets run in order' do
    puts 'in the example'
  end
end

describe 'around filter1' do
  around(:example) do |example|
    puts 'around example before'
    example.run
    puts 'around example after'
  end

  before(:example) do
    puts 'before example'
  end

  after(:example) do
    puts 'after example'
  end

  it 'gets run in order' do
    puts 'in the example'
  end
end

describe 'around filter2' do
  around(:example) do |example|
    puts 'around example before'
    example.run
    puts 'around example after'
  end

  before(:context) do
    puts 'before context'
  end

  after(:context) do
    puts 'after context'
  end

  it 'gets run in order' do
    puts 'in the example'
  end
end

module IncludedInConfigureBlock
  def included_in_configure_block; true; end
end

RSpec.configure do |c|
  c.include IncludedInConfigureBlock
end

describe 'around filter3' do
  around(:example) do |example|
    example.run
  end

  it 'runs the example in the correct context' do
    expect(included_in_configure_block).to be_truthy
  end
end

describe 'if there are multiple around hooks in the same scope' do
  around(:example) do |example|
    puts 'first around hooks before'
    example.run
    puts 'first around hooks after'
  end

  around(:example) do |example|
    puts 'second around hook before'
    example.run
    puts 'second around hook after'
  end

  it 'they should all be run' do
    puts 'in the example'
    expect(1).to eq(1)
  end
end

describe 'if there are around hooks in an outer scope' do
  around(:example) do |example|
    puts 'first outermost around hook before'
    example.run
    puts 'first outermost around hook after'
  end

  around(:example) do |example|
    puts 'second outermost around hook before'
    example.run
    puts 'second outermost around hook after'
  end

  describe 'outer scope' do
    around(:example) do |example|
      puts 'first outer around hook before'
      example.run
      puts 'first outer around hook after'
    end

    around(:example) do |example|
      puts 'second outer around hook before'
      example.run
      puts 'second outer around hook after'
    end

    describe 'inner scope' do
      around(:example) do |example|
        puts 'first inner around hook before'
        example.run
        puts 'first inner around hook after'
      end

      around(:example) do |example|
        puts 'second inner around hook before'
        example.run
        puts 'second inner around hook after'
      end

      it 'they should all be run' do
        puts 'in the example'
      end
    end
  end
end
