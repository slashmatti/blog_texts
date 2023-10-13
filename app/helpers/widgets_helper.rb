module WidgetsHelper
    def maybe_preselect(widget, shape)
        'shape-selected' if widget.shape == shape
    end
end
