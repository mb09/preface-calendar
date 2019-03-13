class CalendarController < ApplicationController

  def index

    @timeslots = Timeslot.all.all.order("dow ASC, start_time ASC")
    @teachers = Teacher.all
    @teacher_subjects = TeacherSubject

    @dow_names = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  end
end
