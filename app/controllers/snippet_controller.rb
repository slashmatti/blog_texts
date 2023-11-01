class SnippetController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_snippet

    def show
    end

    private

    def set_snippet
        @widget = Widget.find_by(client_id: params[:id])
    end
end
