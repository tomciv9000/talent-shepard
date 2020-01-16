module ProjectsHelper

    def start_date(event)
        #event.start_date.strftime("Start Date: %B %e, %Y")
        event.start_date.try(:strftime, "Start Date: %B %e, %Y")
    end


end


#With try
#
#@person.try(:name)
#try also accepts arguments and/or a block, for the method it is trying
#
#Person.try(:find, 1)
#@people.try(:collect) {|p| p.name}