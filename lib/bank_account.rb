require "pry"
class BankAccount
    attr_accessor :balance, :status, :sender, :receiver
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        @balance += amount
    end

    # def withdraw(amount)
    #     @balance -= amount
    # end

    def display_balance
        self.balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @status = "closed"
    end

end

bank_123 = BankAccount.new("lisa")
#binding.pry

