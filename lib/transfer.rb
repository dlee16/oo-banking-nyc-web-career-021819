require "pry"

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if status == nil
      false
    else
      true
    end
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if @amount < sender.balance
      if @status == "pending" && sender.valid? == true
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
