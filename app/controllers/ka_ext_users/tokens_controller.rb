module KaExtUsers
  class TokensController < KaExtUsers::ApplicationController
    represents :json, :entity => ::TokenRepresenter, :collection => ::TokensRepresenter

    before_filter :add_user_id

    def index
        @tokens = nil
        if !params[:user_id].blank?
            @tokens = Token.find_by(:user_id => params[:user_id]).first
        else
            @tokens = Token.all
        end
        respond_with @tokens
    end

    def show
        if params[:id].to_s.length == 32
            @token = Token.find_by(:token => params[:id])
        else
            @token = Token.find(params[:id])
        end
        respond_with @token
    end

    def update
        @token = Token.find(params[:id])
        if @token.update_attributes(token_params)
            head :no_content
        else
            head :bad_request
        end
    end

    def create
        @token = Token.find_or_create_by(:user_id => params[:token][:user_id],:website_id => params[:token][:website_id])
        @token.update_attributes(token_params)

        if @token.save
            respond_with @token
        else
            head :unprocessable_entity
        end
    end

    def destroy
        if params[:id].to_s.length == 32
            Token.find_by(:token => params[:id]).destroy
        else
            Token.find(params[:id]).destroy
        end
        head :ok
    end

    def add_user_id
        params[:token][:user_id] = params[:user_id] unless params[:user_id].blank? || params[:token].nil?
    end

    private
        def token_params
            params.require(:token).permit(:user_id, :website_id, :token, :external_token, :external_token_expiration)
        end
  end
end