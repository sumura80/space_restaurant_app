class StoresController < ApplicationController
	before_action :find_store, only: [:show, :edit, :update, :destroy]
	def index
		if params[:category].blank?
			@stores = Store.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@stores = Store.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		
	end

	def new
		@store= Store.new
	end
	def create
		@store= Store.new(stores_params)
		if @store.save
			redirect_to @store
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @store.update(stores_params)	
			redirect_to @store
		else
			render 'edit'
		end
	end

	def destroy
		@store.destroy
		redirect_to root_path
	end

	private
	def stores_params
		params.require(:store).permit(:title, :description, :company, :url, :category_id)
	end

	def find_store
		@store = Store.find(params[:id])
	end
end
