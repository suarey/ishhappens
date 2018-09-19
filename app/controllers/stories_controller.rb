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
    
      # GET /houses/1/edit
      def edit
        @story = Story.find params[:id]
      end
    
      # POST /houses

      # POST /houses.json
      def create
        @story = current_user.stories.new(story_params)

        
        if @story.save
          redirect_to @story, notice: 'Story was successfully created!' 
        else
            redirect_to 'new'
        end
      end
    
      # PATCH/PUT /houses/1
      # PATCH/PUT /houses/1.json
        def update
          respond_to do |format|
            if @story.update(story_params)
            redirect_to @story, notice: 'Story was successfully updated.' 

            else
            render :edit 
            end
          end
        end
      
      # DELETE /houses/1
      # DELETE /houses/1.json
      def destroy
        @story.destroy
        respond_to do |format|
           redirect_to story_url, notice: 'Story was successfully destroyed.' 
          head :no_content 
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        # def set_story
        #   @story = Story.find(params[:id])
        # end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def story_params
          params.require(:story).permit(:username, :description)
        end

end
