require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant."
  }
]

input = ""

while input != "bye" 
  puts "Hello! How can I help you today"
  puts "-" * 50

  input = gets.chomp
  puts "\n"

  if input != "bye"
    message_list.push({"role" => "user", "content" => input})

    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
        }
      )

      response = api_response["choices"][0]["message"]["content"]
      puts response 
      puts "-" * 50

      message_list.push ({"role" => "assistant", "content" => response})
  end
end

puts "Goodbye!"
