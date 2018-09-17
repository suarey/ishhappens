class StoriesController < ApplicationController

    before_action :set_story, only: [:show, :edit, :update, :destroy]
    before_action :authorize, except: [:index, :show]

    def index
        @stories = Story.all
      end

      def show
      end 

      def new
        @story = Story.new
      end
    
      # GET /houses/1/edit
      def edit
      end
    
      # POST /houses
      # POST /houses.json
      def create
        @story = Story.new(story_params)
    
        respond_to do |format|
          if @house.save
            format.html { redirect_to @story, notice: 'Story was successfully created!' }
            format.json { render :show, status: :created, location: @house }
          else
            format.html { render :new }
            format.json { render json: @story.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /houses/1
      # PATCH/PUT /houses/1.json
      def update
        respond_to do |format|
          if @story.update(story_params)
            format.html { redirect_to @story, notice: 'House was successfully updated.' }
            format.json { render :show, status: :ok, location: @story }
          else
            format.html { render :edit }
            format.json { render json: @story.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /houses/1
      # DELETE /houses/1.json
      def destroy
        @story.destroy
        respond_to do |format|
          format.html { redirect_to story_url, notice: 'Story was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_story
          @story = Story.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def story_params
          params.require(:story).permit(:address, :bedrooms, :baths, :price)
        end
    end
    

