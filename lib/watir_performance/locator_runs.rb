module WatirPerformance
  class LocatorRuns

    def initialize
      @results = Results.new
    end

    def execute(how, what)
      watir_time = Benchmark.realtime { Page.browser.a(how, what).send :locate }
      @results.send("#{how}_watir=", watir_time)

      wd_time = Benchmark.realtime { Page.browser.driver.first(how, what) }
      @results.send("#{how}_wd=", wd_time)
    end

=begin
      repeat.times do

        start_time = Time.now
        @results.send("#{how}_wd=", Time.now - start_time)

        start_time = Time.now
        Page.browser.a(how, /\#text_\d/).send :locate
        @results.send("#{how}_regex=", Time.now - start_time)
      end
    end
=end

    def output
      @results
    end


  end
end