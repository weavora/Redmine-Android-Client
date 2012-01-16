xml.instruct!
xml.events :type => 'array' do
  @events.each do |event|
    xml.event do
      xml.type          event.event_type.gsub(/[\s\_]/, "-")
      xml.datetime      event.event_datetime
      xml.project_name  event.project if event.project

      if (event.class.to_s == "Issue")
        xml.issue_tracker  event.tracker.name.downcase == "bug" ? "bug" : "issue"
      elsif (event.class.to_s == "Journal")
        xml.issue_tracker  event.issue.tracker.name.downcase == "bug" ? "bug" : "issue"
      else
        xml.issue_tracker  ""
      end

      if (event.class.to_s == "Issue")
        xml.title  "##{event.id} #{event.subject}"
      elsif (event.class.to_s == "Journal")
        xml.title  "##{event.issue.id} #{event.issue.subject}"
      else
        xml.title  format_activity_title(event.event_title)
      end
      xml.project_identifier  event.project.identifier if event.project
      xml.url           url_for event.event_url
      xml.description   format_activity_description(event.event_description)
      xml.author_name   event.event_author if event.event_author
      xml.author_login  event.event_author.login if event.event_author
    end
  end
end