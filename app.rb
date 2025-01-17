require_relative "config/environment"

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    params[:name].reverse
  end

  get "/square/:number" do
    (params[:number].to_i ** 2).to_s
  end

  get "/say/:number/:phrase" do
    params[:phrase] * params[:number].to_i
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    output=""
    5.times do
      |i|
      key="word#{i+1}".to_sym
      output+=params[key]
      output+=" " if i<4
      output+="." if i==4
    end

    return output
  end

  get "/:operation/:number1/:number2" do
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    case params[:operation]
    when "add"
      (num1 + num2).to_s
    when "subtract"
      (num1 - num2).to_s
    when "multiply"
      (num1 * num2).to_s
    when "divide"
      (num1 / num2).to_s
    end
  end
end
