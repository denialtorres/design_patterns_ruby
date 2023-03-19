# Recasting our report formatting example to use a Proc Strategy is trivial.
# the only changes we need to make to the Report class are to add an ampersand to
# pick up any block that is passed to the initialize methods and to rename the method
# that we call from output_report to call

# Lambda
HTML_FORMATTER = lambda do |context|
  puts "<html>"
  puts "<head>"
  puts "<title> #{context.title} </title>"
  puts "</head>"
  puts "<body>"
  context.text.each do |line|
    puts "<p>#{line}</p>"
  end
  puts "</body>"
  puts "</html>"
end

PLAN_TEXT_FORMATTER = lambda do |context|
  puts "*** #{context.title} ***"
  context.text.each do |line|
    puts line
  end
end

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = "Monthly Report"
    @text = ["Things are going", "Really, really well"]
    @formatter = formatter
  end

  def output_report
    # here report passess a refernce to itself -> to the formatting strategy
    # then the formatter class calls the new title and text methods to get the data
    # it needs
    @formatter.call(self)
  end
end

report = Report.new(&HTML_FORMATTER)
report.output_report

report = Report.new(&PLAN_TEXT_FORMATTER)
report.output_report
