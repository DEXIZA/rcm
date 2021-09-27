Ransack.configure do |config|
  config.add_predicate 'lteq_end_of_day',
  :arel_predicate => 'lteq',
  :formatter => proc {|v| v.end_of_day},
  :compounds => false
end




# Ransack.configure do |config|
#   config.add_predicate 'between_begin_and_end',
#                    arel_predicate: 'between_begin_and_end',
#                    formatter: proc { |v| v.to_date },
#                    validator: proc { |v| v.present? },
#                    type: :string
# end

# module Arel
#   module Predications
#     def between_begin_and_end date
#       gteq(date.to_date.beginning_of_day).and(lt(date.end_of_day))
#     end
#   end
# end

# Ransack.configure do |config|
#   config.add_predicate 'between',
#                        arel_predicate: 'between',
#                        formatter: proc { |v| v.split(' to ') },
#                        type: :string
# end

# module Arel
#   module Predications
#     def between other
#       gteq(other[0]).and(lt(other[1]))
#     end
#   end
# end