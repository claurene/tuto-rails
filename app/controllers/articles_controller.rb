class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article, :notice => "L'article a bien été sauvegardé."
        else
            @notice = "L'article n'a pas pu être sauvegardé. Veuillez vérifier que votre titre contienne plus de cinq caractères."
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
            redirect_to @article, :notice => "L'article a bien été mis à jour."
        else
            @notice = "L'article n'a pas pu être mis à jour. Veuillez vérifier que votre titre contienne plus de cinq caractères."
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path, :notice => "L'article a bien été supprimé."  
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
