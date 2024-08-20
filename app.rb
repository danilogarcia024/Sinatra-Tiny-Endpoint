require 'sinatra'
require 'active_support'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'
require 'pry'

SECURITY_TOKEN = 'f+grnw7WFu1XX6dRWoEiF7uX9TEALr74i+Ms5xMfOkkfQm28LF4rjex4oTFobH/P5Tg='.freeze

get '/' do
  "API is working!"
end

get '/:current_date' do
  content_type :json
  bearer_token = request.env["HTTP_AUTHORIZATION"]&.split(' ')&.last

  halt 401, { message: 'Requires Authentication' }.to_json unless bearer_token == SECURITY_TOKEN

  current_date_str = params[:current_date]
  current_date = Date.parse(current_date_str)
  {
    first_day_of_month: current_date.beginning_of_month.strftime('%Y-%m-%d'),
    last_day_of_month: current_date.end_of_month.strftime('%Y-%m-%d')
  }.to_json
end
