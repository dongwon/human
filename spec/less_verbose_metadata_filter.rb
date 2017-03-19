RSpec.configure do |c|
  c.before(:example, :before_example) { puts 'before example' }
  c.after(:example, :after_example) { puts 'after example' }
  c.around(:example, :around_example) do |example|
    puts 'around example (before)'
    p example
    example.run
    puts 'around example (after)'
  end
  c.before(:context, :before_context) { puts 'before context' }
  c.after(:context, :after_context) { puts 'after context' }
end

describe 'group 1', :before_context, :after_context do
  it("") { puts 'example 1' }
  it("", :before_example) { puts 'example 2' }
  it("", :after_example) { puts 'example 3' }
  it("", :around_example) { puts 'example 4' }
end
