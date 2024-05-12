class CommentsController < ApplicationController
    before_action :authenticate_user!
        def index
        @comments = Comment.all  
        end
  
              
        def new
          @comment = Comment.new
        end

        def create
          musical = Musical.find(params[:musical_id])
          comment = musical.comments.build(comment_params) 
          comment.user_id = current_user.id
          if comment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path) 
          else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path) 
          end
        end
  
  
        def show
          @comment = Comment.find(params[:id])
        end
  
  
        def edit
          @comment = Comment.find(params[:id])
        end
  
  
        def update
          comment = Comment.find(params[:id])
  
          if comment.update(comment_params)
            redirect_to :action => "show", :id => comment.id
          else
            redirect_to :action => "new"
          end
        end
  
  
        def destroy
          comment = Comment.find(params[:id])
          comment.destroy
          redirect_to action: :index
        end

        private
        def comment_params
          params.require(:comment).permit(:content, :name, :username, :songlevel, :storylevel, :likelevel, :youtube_url, :musical_id, :subtitles)
        end
      
       
end
