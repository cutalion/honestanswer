module ApplicationHelper
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(:datetime => time.getutc.iso8601)) if time
  end

  def broadcast(channel, &block)
    message = capture(&block)
    EM.run { request.env['faye.client'].publish channel, message }
  end 
end
