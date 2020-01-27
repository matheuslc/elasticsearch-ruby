# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Returns information about the tasks currently executing on one or more nodes in the cluster.

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/tasks.html
        #
        def tasks(arguments = {})
          arguments = arguments.clone

          method = HTTP_GET
          path   = "_cat/tasks"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:tasks, [
          :format,
          :node_id,
          :actions,
          :detailed,
          :parent_task,
          :h,
          :help,
          :s,
          :time,
          :v
        ].freeze)
  end
      end
end
end
