module ProjectsHelper

    def start_date(event)
        event.start_date.try(:strftime, "%B %e, %Y")
    end

end