require_relative 'accounts'
require_relative 'email_account'

accounts = Accounts.new("accounts.cfg")
accounts.accounts.each do |a|
  email_account = EmailAccount.new
  email_account.login(a.server, a.username, a.password)
  email_account.verify
  email_account.clean
  email_account.logout
end

