require 'sinatra'

WORDS = {
  "foo"  => ["foo" , "bar" ],
  "fizz" => ["fizz", "buzz"],
  "ping" => ["ping", "pong"],
  "herp" => ["herp", "derp"]
}

get '/' do
  delimiter = (params["curl"] ? "\n" : "<br />")
  words = WORDS[ (params["words"] or "fizz") ]
  (1..100).map do |i|
    if i % 15 == 0 
      words.join('')
    elsif i % 3 == 0
      words[0]
    elsif i % 5 == 0
      words[1]
    else
      i
    end                 # we should end with a \n if the destination is console
  end.join(delimiter) + (delimiter == "\n" ? "\n" : "")
end
