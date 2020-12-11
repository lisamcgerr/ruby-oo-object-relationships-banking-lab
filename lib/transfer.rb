require 'pry'
class Transfer
  attr_accessor :bankaccount, :receiver, :sender, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
     if self.valid? && @sender.balance >= @amount
      while @status != "complete"
       @sender.balance -= @amount 
       @receiver.balance += @amount 
       @status = "complete"
      end
      else @sender.balance < @amount || @sender.status = "closed" || @receiver.status = "closed"
       "Transaction rejected. Please check your account balance."
       @status = "rejected"
    end
  end

  def reverse_transfer
    if self.execute_transaction.status == "complete"
      @sender.balance += @amount 
      @receiver.balance -= @amount 
    end
  end

end

new_transfer = Transfer.new("Lisa", "Aaron", 50)
#binding.pry