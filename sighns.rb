

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding :UTF8)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
   io.set_encoding(Encoding.default_external,
                   Encoding.default_internal)
  end
end

require "json"
require "date"

file = File.read('sign.json', encoding: "UTF-8")
signs = JSON.parse(file)
puts signs
puts "Укажите дату, когда Вы родились,например 07.08"
input_date = STDIN.gets.chomp

user_birth_date = Date.parse(input_date + '.2000')

user_sign = nil

  signs.each do |key, sign|
    dates = sign['dates'].split('..')
    if (Date.parse(dates[0] + '.2000') <= user_birth_date) &&
         (user_birth_date <= Date.parse(dates[1] + '.2000'))

      user_sign = sign

    end
  end
puts user_sign['dates']
puts user_sign['text']