class SmsService
    def initialize(message)
        @message = message
    end

    def send_text!
        params = {number: '', message: body}
        resp = HTTParty.get(ENV['sms_server'], body: params)
        JSON.parse(resp.body)
    end

    def body
        "[#{message.name}] #{message.content}"
    end
end