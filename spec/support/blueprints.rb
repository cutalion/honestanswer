require 'machinist/active_record'

Question.blueprint do
  text  { "#{sn}+#{sn}=?" }
  token { "#{sn}" }
end
