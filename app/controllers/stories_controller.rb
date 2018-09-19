class StoriesController < ApplicationController

    # before_action :set_story, only: [:show, :edit, :update, :destroy]
    before_action :authorize, except: [:index, :show]

    def index
        @stories = Story.all
      end

      def show
        @story = Story.find params[:id] 
      end 

      def new
        @story = Story.new
      end
    
     
      def edit
        @story = Story.find params[:id]
      end

      def create
        @story = current_user.stories.new(story_params)
        # @story = current_user.stories.new
        
        if @story.save
          redirect_to story_path(@story)
        else
            redirect_to 'new'
        end
      end
    

        def update
          @story = Story.find(params[:id])

          if @story.update(story_params)
            redirect_to story_path(@story)
          else 
            redirect to "edit"
          end
          # respond_to @story do |format|
          #   if @story.update(story_params)
          #   redirect_to @story, notice: 'Story was successfully updated.' 

          #   else
          #   render :edit 
          #   end
          # end
        end
      
      def destroy
        @story = Story.find params[:id]
        @story.destroy 
        redirect_to stories_path
      
        # respond_to do |format|
        #    redirect_to story_path, notice: 'Story was successfully deleted.' 
        #   head :no_content 
       
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        # def set_story
        #   @story = Story.find(params[:id])
        # end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def story_params
          params.require(:story).permit(:title, :description)
        end

end
