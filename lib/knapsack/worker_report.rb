# This class is used by the avalanche workers
module Knapsack  
  class WorkerReport
    include Singleton

    def save(report_path)
      File.open(report_path, 'w+') do |f|
        f.write(report_json)
      end
    end

    private

    def report_json
      Presenter.report_json
    end
  end
end