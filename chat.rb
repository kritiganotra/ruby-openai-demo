require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like Shakespeare."
  },
  {
    "role" => "user",
    "content" => "Hello! What are the best spots for pizza in Chicago?"
  }
]

api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

pp api_response
