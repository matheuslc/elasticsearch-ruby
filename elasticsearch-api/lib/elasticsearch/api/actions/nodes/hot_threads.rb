# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Nodes
      module Actions
        # Returns information about hot threads on each node in the cluster.

        #
        # @option arguments [List] :node_id A comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cluster-nodes-hot-threads.html
        #
        def hot_threads(arguments = {})
          arguments = arguments.clone

          _node_id = arguments.delete(:node_id)

          method = HTTP_GET
          path   = if _node_id
                     "_cluster/nodes/#{Utils.__listify(_node_id)}/hot_threads"
                   else
                     "_cluster/nodes/hot_threads"
  end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:hot_threads, [
          :interval,
          :snapshots,
          :threads,
          :ignore_idle_threads,
          :type,
          :timeout
        ].freeze)
  end
      end
end
end
