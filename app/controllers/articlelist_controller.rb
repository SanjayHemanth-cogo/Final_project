class ArticlelistController < ApplicationController
    skip_before_action :authenticate_request
    def showAll
        temp = Article.joins(:user,:category).select('articles.id,articles.title,articles.description,articles.content,articles.created_at as date,users.name as author,users.designation as author_designation,categories.category_name')
        render json:temp
    end
end
# Article.create(title:'First Article',discription:'my first article')