get '/' do
    articles = []
    @content = ""
    8.downto(1) do |i|
        articles[i] = Article.new("articles/#{i}.txt")
        @content += "<div class=\"article-title\"><a href=\"articles/#{i}\" target=\"_blank\"> #{articles[i].title} </a></div>"
        @content += "<div class=\"article-content\"> #{articles[i].content[0...400]}... </div>"
    end
    erb :index
end

get '/articles/:id' do
    article = Article.new("articles/#{params[:id]}.txt")
    @article_title = article.title
    @article_content = article.content
    erb :article
end
