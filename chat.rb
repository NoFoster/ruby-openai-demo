require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))


pp "Hello! How can I help you today?"
pp "-" * 50
##response = gets.chomp
response = "You're a helpful assistant who talks like Dora"
message_list = [
  {
    "role" => "system",
    "content" => "#{response}"
  },
  {
    "role" => "user",
    "content" => "Hello! What are teh best spots for pizza in chicago?"
  }
]

api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)
message_hash = api_response.fetch("choices").at(0)
pp content = message_hash.fetch("message").fetch("content")
pp "-" * 50
