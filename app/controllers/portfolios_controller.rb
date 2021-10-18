class PortfoliosController < ApplicationController
  layout 'portfolio'
  
    def index
      @portfolio_items = Portfolio.all
    end

    def react
      @react_portfolio_items = Portfolio.react
    end

    def ruby_on_rails_portfolio_items
      @ruby_on_rails_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    end

    def new
      @portfolio_item = Portfolio.new
      3.times { @portfolio_item.technologies.build }
    end

    def create
      @portfolio_item = Portfolio.new(portfolio_params)

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'Your portfolio item is created' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
      @portfolio_item = Portfolio.find(params[:id])
    end

    def update
      @portfolio_item = Portfolio.find(params[:id])

      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'Your portfolio item was edited' }
        else
          format.html { render :edit }
        end
      end
    end

    def show
      @portfolio_item = Portfolio.find(params[:id])
    end

    def destroy
      # perform the look up
      @portfolio_item = Portfolio.find(params[:id])

      # destroy the record
      @portfolio_item.destroy

      # redirect
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Record was successfully removed' }
      end
    end

    private

    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :image, technologies_attributes: [:name])
    end
end
