class UsersController < ApplicationController
    before_action :authenticate_request
    def createArticle
        author = User.find_by(name: params[:user_name]).id
        category = params[:category]
        temp_cat = Category.find_by(category_name: category)
        if(temp_cat.nil?)
            temp_cat = Category.create(category_name: params[:category])
        end
        render json:Article.create(title: params[:title],description: params[:description],content: params[:content],user_id: author,category_id: temp_cat.id)
    end

    def editArticle
        render json:Article.find(params[:article_id]).update(title: params[:title],description: params[:description],content: params[:content])
    end

    def deleteArticle
        Article.find(params[:article_id]).delete()
    end

    def userList
        render json: User.find(params[:user_id]).articles
    end
end
