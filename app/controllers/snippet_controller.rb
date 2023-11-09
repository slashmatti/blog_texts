class SnippetController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_snippet

    def show
        if @widget.nil?
            head :ok
        end
    end

    private

    def set_snippet
        @widget = Widget.find_by(client_id: params[:client_id])
    end
end
