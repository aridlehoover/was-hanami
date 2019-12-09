module Web
  module Views
    module Alerts
      class Show
        include Web::View

        def publish_at
          local_time(alert.publish_at)
        end

        def effective_at
          local_time(alert.effective_at)
        end

        def expires_at
          local_time(alert.expires_at)
        end

        private

        def local_time(time)
          time&.localtime&.strftime('%Y-%m-%d %H:%M:%S %Z')
        end
      end
    end
  end
end
