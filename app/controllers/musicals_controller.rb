class MusicalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
      def index
      @musicals = Musical.all   
      
      if params[:tag]
        Tag.create(name: params[:tag])
      end
      if params[:tag_ids]
        @musicals = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_musicals = Tag.find_by(name: key).musicals
            @musicals = @musicals.empty? ? tag_musicals : @musicals & tag_musicals
          end
        end
      end
      end

      def new
        @musical = Musical.new
      end
    
      def show
        @musical = Musical.find(params[:id])
        @comments = @musical.comments
        @comment = Comment.new
      end

      def create
        musical = Musical.new(musical_params)
        musical.user_id = current_user.id
        if musical.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def edit
        @musical = Musical.find(params[:id])
      end
      
      def update
        musical = Musical.find(params[:id])
        if musical.update(musical_params)
          redirect_to :action => "show", :id => musical.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        musical = Musical.find(params[:id])
        musical.destroy
        redirect_to action: :index
      end

      private
      def musical_params
        params.require(:musical).permit(:name, :youtube_url, :point, tag_ids: [])
      end

end
    
   