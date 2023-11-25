module Hashable
    extend ActiveSupport::Concern

    included do
        before_create :generate_client_id
        # all code in this block should behave as if it were defined directly in the model
    end

    def generate_client_id
    self.client_id = SecureRandom.hex(5)
    end
end