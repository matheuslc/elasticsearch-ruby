# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Shows how much heap memory is currently being used by fielddata on every data node in the cluster.

        #
        # @option arguments [List] :fields A comma-separated list of fields to return the fielddata size

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-fielddata.html
        #
        def fielddata(arguments = {})
          arguments = arguments.clone

          _fields = arguments.delete(:fields)

          method = HTTP_GET
          path   = if _fields
                     "_cat/fielddata/#{Utils.__listify(_fields)}"
                   else
                     "_cat/fielddata"
  end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:fielddata, [
          :format,
          :bytes,
          :h,
          :help,
          :s,
          :v,
          :fields
        ].freeze)
  end
      end
end
end
