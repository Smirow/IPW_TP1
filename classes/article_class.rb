class Article
    def initialize(file_name)
        @file_name = file_name
        @title = read_title(file_name)
        @content = read_corp(file_name)
    end

    def file_name
        @file_name
    end

    def title
        @title
    end

    def content
        @content
    end

    def read_title(file_name)
        file = File.open(file_name, "r")
        data = file.readline()
        file.close
        return data
    end

    def read_corp(file_name)
        data = ""
        file = File.open(file_name, "r")
        file.readlines().drop(1).each do |line|
            data += line
        end
        return data
    end

end
