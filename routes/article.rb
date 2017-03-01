get '/' do
    articles = []
    page = params[:page]
    @content = ""
    if page && page.to_i <= 3 && page.to_i > 0
        page = 3*page.to_i - 2
        pageUp = page + 2
        if pageUp > 8 
            pageUp = 8
        end 
    else 
        page = 1
        pageUp = 8
    end
    page.upto(pageUp) do |i|
        articles[i] = Article.new("articles/#{i}.txt")
        @menu = "<a href=\?page=1>Page 1 </a><a href=\?page=2>Page 2 </a><a href=\?page=3>Page 3</a>"
        @content += "<div class=\"article\">"
        @content += "<div class=\"article-title\"><a href=\"articles/#{i}\" target=\"_blank\"> #{articles[i].title} </a></div>"
        @content += "<div class=\"article-content\"> #{articles[i].content[0...400]}... </div>"
        @content += "</div>"
    end
    erb :index
end

get '/articles/:id' do
    article = Article.new("articles/#{params[:id]}.txt")
    @article_title = article.title
    @article_content = article.content
    erb :article
end
