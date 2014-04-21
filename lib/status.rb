class GithubStatusGUI
  class Status
    def initialize
      @data = JSON.parse(open(STATUS_URL).read)
    end

    def data
      @data
    end

    def text
      @data['status']
    end

    def color
      case @data['status']
      when 'good' then '#008000'
      when 'minor' then '#ffa500'
      when 'major' then '#ff0000'
      end
    end
  end
end