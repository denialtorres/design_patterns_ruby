class Formatter
  def output_report(context)
    raise "Abstract method called"
  end
end

# strategy objects
class HTMLFormatter < Formatter
  def output_report(context)
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
end

# strategy objects
class PlainTextFormatter
  def output_report(context)
    puts "*** #{context.title} ***"
    context.text.each do |line|
      puts line
    end
  end
end

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = "Monthly Report"
    @text = ["Things are going", "Really, really well"]
    @formatter = formatter
  end

  def output_report
    # here report passess a refernce to itself -> to the formatting strategy
    # then the formatter class calls the new title and text methods to get the data
    # it needs
    @formatter.output_report(self)
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report

report = Report.new(PlainTextFormatter.new)
report.output_report
