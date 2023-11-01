# llama-server

Dockerized llama server. 

# usage

curl -X POST -H "Content-Type: application/json" -d '{
  "system_message": "You are a helpful assistant",
  "user_message": "Generate a list of 5 funny dog names",
  "max_tokens": 100
}' http://127.0.0.1:5000/llama