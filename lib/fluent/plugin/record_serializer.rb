module Fluent
  module RecordSerializer
    def serialize_record(format, record)
      if format == 'json'
        json_dump(record)
      elsif format == 'yaml'
        record.to_yaml
      end
    end

    private

    begin
      require 'oj'
      def json_dump(record)
        Oj.dump(record, :mode => :compat)
      end
    rescue LoadError
      def json_dump(record)
        record.to_json
      end
    end
  end
end
