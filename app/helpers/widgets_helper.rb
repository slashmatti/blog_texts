module WidgetsHelper
    def maybe_preselect(widget, shape)
        'shape-selected' if widget.shape == shape
    end

    def snippet_code(widget)
        "<script src='#{ENV['BASE_URL']}/snippet.js?client_id=#{widget.client_id}'></script>"
    end
end
