class GithubStatusGUI
  class Messages
    def initialize
      @data = JSON.parse(open(MESSAGES_URL).read)
    end

    def data
      @data
    end
  end
end