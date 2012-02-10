module ApplicationHelper
  def title
    @title
  end

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(:datetime => time.getutc.iso8601)) if time
  end

  def gravatar_for(user, options = {})
    image_tag "http://www.gravatar.com/avatar/#{user.id}?s=32&d=identicon&r=PG", { :alt => user.name }.merge(options)
  end
end
