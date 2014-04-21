require "shoes"
require "open-uri"
require "json"
require "time"

require_relative "lib/config"
require_relative "lib/messages"
require_relative "lib/status"

Shoes.app title: 'Github Status' do
  def status_color(string)
    case string
    when 'good' then green
    when 'minor' then orangered
    when 'major' then red
    end
  end

  background gainsboro
  status = GithubStatusGUI::Status.new

  stack do
    banner "#{status.text.upcase}", align: 'center', stroke: status.color
    inscription Time.parse(status.data['last_updated']).strftime("%A the %e of %B, %Y, %I:%M:%S %Z.")
  end

  stack do
    background blue
  end

  stack do
    background black
    inscription "", size: 11
  end

  stack do
    para "Previous messages:"
    messages = GithubStatusGUI::Messages.new
    messages.data.each do |message|
      para message['body'], stroke: status_color(message['status'])
      inscription Time.parse(message['created_on']).strftime("%A the %e of %B, %Y, %I:%M:%S %Z.")+" status: #{message['status']}."
    end
  end

  stack do
    inscription "", size: 1
  end

  flow do
    caption "Github ", weight: 'bold'
    caption " Status", stroke: status.color
  end
end