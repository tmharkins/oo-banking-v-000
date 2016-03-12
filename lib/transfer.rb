require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    return if @status == "complete"

    if sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  end

  def reverse_transfer
    return if @status != "complete"
    sender.balance += amount
    receiver.balance -= amount
    @status = "reversed"
  end
end