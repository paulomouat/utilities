require 'net/pop'

class EmailAccount

  attr_reader :pop
  attr_reader :username

  def login(server, username, password)
    @username = username
    puts "Logging in to account #@username ..."
    @pop = Net::POP3.new server
    @pop.start username, password
  end

  def verify

    puts "Verifying account #@username ..."

    if @pop.mails.empty?
      puts "Account #@username has no mail."
    else
      puts "Account #@username has #{@pop.mails.length} new messages."
    end

  end

  def clean
    puts "Deleting all #{@pop.mails.length} messages..."
    @pop.delete_all
    #start = 1
    #count = 0
    #step = 10
    #@pop.mails.each do |m|
    #  m.pop
    #  m.delete
    #  ++count
    #  if count % step == 0
    #    puts "Deleted messages #{start}-#{start + step}."
    #    start += step
    #  end
    #end
  end

  def logout
    @pop.finish
  end

  end