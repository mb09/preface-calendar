class CalendarController < ApplicationController

  def index

    @timeslots = Timeslot.all.all.order("dow ASC, start_time ASC")
    @teachers = Teacher.all
    @teacher_subjects = TeacherSubject

    @dow_names = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
  end
end
