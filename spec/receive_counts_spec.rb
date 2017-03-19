class Account
  def initialize(logger)
    @logger = logger
  end

  def open
    @logger.account_opened
  end
end

describe Account do
  let(:logger) { double("Logger") }
  let(:account) { Account.new(logger) }

  example 'once' do
    expect(logger).to receive(:account_opened).once
    account.open
  end

  example 'twice' do
    expect(logger).to receive(:account_opened).twice
    account.open
    account.open
  end

  example 'exactly(n).times' do
    expect(logger).to receive(:account_opened).exactly(3).times
    account.open
    account.open
    account.open
  end

  example 'at_least(:once)' do
    expect(logger).to receive(:account_opened).at_least(:once)
    account.open
    account.open
  end

  example 'at_least(:twice)' do
    expect(logger).to receive(:account_opened).at_least(:twice)
    account.open
    account.open
    account.open
  end

  example 'at_least(n).times' do
    expect(logger).to receive(:account_opened).at_least(3).times
    account.open
    account.open
    account.open
    account.open
  end

  example 'at_most(:once)' do
    expect(logger).to receive(:account_opened).at_most(:once)
  end

  example 'at_most(:twice)' do
    expect(logger).to receive(:account_opened).at_most(:twice)
    account.open
  end

  example 'at_most(n).times' do
    expect(logger).to receive(:account_opened).at_most(3).times
    account.open
    account.open
  end

end
