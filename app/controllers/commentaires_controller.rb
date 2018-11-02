class CommentairesController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.commentaires.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.commentaires.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
     
    private
        def comment_params
            params.require(:commentaire).permit(:auteur, :body)
        end
end
