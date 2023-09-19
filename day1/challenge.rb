# Assume you have two distributed data sources. Your task is to
# collect all data from these sources and return an aggregated result.
class SlipProcessor
    def initialize(slips, transactions)
      @slips = slips
      @transactions = transactions
    end

    def process
      result = {} 

      @slips.each do |slip_key, slip_value|
          slip_number = slip_key.sub('slip_','').to_i
          transactions = slip_value[:transactions]
          total_amount = calculate_total_amount(transactions)

          result[slip_number] = {
              number_transactions: transactions.length,
              total_amount: total_amount
          }
      end
      result
    end

    private

    def calculate_total_amount(transaction_ids)
        transaction_ids.reduce(0) do |sum, transaction_id|
            transaction = @transactions.find { |t| t[:id] == transaction_id }
            if transaction[:payout]
                sum - transaction[:amount]
            else
                sum + transaction[:amount]
            end
        end
    end
end

slips = {
  "slip_23" => {
    transactions: [123, 456]
  },
  "slip_42" => {
    transactions: [789]
  }
}

transactions = [
  {
    id: 123,
    amount: 10.01,
    payout: false
  },
  {
    id: 456,
    amount: 5.01,
    payout: true
  },
  {
    id: 789,
    amount: 20.1,
    payout: false
  }
]

processor = SlipProcessor.new(slips, transactions)
result = processor.process
puts result