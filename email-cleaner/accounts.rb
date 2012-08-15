class AccountSettings < Struct.new(:server, :username, :password)
end

class Accounts

  attr_reader :accounts

  def initialize(filename)
    @accounts = []
    @lines = IO.readlines(filename)
    @lines.each do |line|
      elements = line.split(',').map(&:strip)
      account_settings = AccountSettings.new(elements[0], elements[1], elements[2])
      @accounts.push account_settings
    end
  end

end