First Let's Create an Index and Try to Understand the basic default properties it comes with then we will modify it. 

```
An index is like a ‘database' in a relational database. It has a mapping which defines multiple types.
An index is a logical namespace which maps to one or more primary shards and can have zero or more replica shards.
```

# Articles to Read [ Open this Url Before Moving Forward ]

   https://www.elastic.co/blog/what-is-an-elasticsearch-index

   https://aravind.dev/everything-index-elastic/

   https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules.html

Index Modules are modules created per index and control all aspects related to an index.


# Index Settings : 
Index level settings can be set per-index. 
Settings may be:

# static
They can only be set at index creation time / may be on a closed index.
```
index.number_of_shards
index.number_of_routing_shards
index.codec

```

# dynamic
They can be changed on a live index using the update-index-settings API.
Changing static or dynamic index settings on a closed index could result in incorrect settings that are impossible to rectify without deleting and recreating the index.

```
index.number_of_replicas
index.auto_expand_replicas
index.search.idle.after
index.refresh_interval
index.max_result_window
index.max_inner_result_window
index.max_rescore_window
index.max_docvalue_fields_search
index.max_script_fields
index.max_ngram_diff
index.max_shingle_diff
index.max_refresh_listeners
index.analyze.max_token_count
index.highlight.max_analyzed_offset
index.max_terms_count
index.max_regex_length
index.query.default_field
index.routing.allocation.enable
index.routing.rebalance.enable
index.gc_deletes
index.default_pipeline
index.final_pipeline
index.hidden

```


# Settings in other index modules
Other index settings are available in index modules:
```
# Analysis
Settings to define analyzers, tokenizers, token filters and character filters.

# Index shard allocation
Control over where, when, and how shards are allocated to nodes.

# Mapping
Enable or disable dynamic mapping for an index.

# Merging
Control over how shards are merged by the background merge process.

# Similarities
Configure custom similarity settings to customize how search results are scored.

# Slowlog
Control over how slow queries and fetch requests are logged.

# Store
Configure the type of filesystem used to access shard data.

# Translog
Control over the transaction log and background flush operations.

# History retention
Control over the retention of a history of operations in the index.

# Indexing pressure
Configure indexing back pressure limit
```


# Fetching all indices in cluster
```
GET _cat/indices?v
```


# Create a new Index 
```
PUT index1

response : 
{
  "acknowledged": true,
  "shards_acknowledged": true,
  "index": "index1"
}

```

# Index Settings 

```
GET index1/_settings

response :
{
  "index1": {
    "settings": {
      "index": {
        "routing": {
          "allocation": {
            "include": {
              "_tier_preference": "data_content"
            }
          }
        },
        "number_of_shards": "1",
        "provided_name": "index1",
        "creation_date": "1676098344109",
        "number_of_replicas": "1",
        "uuid": "mptK9UqbR9mpM4N1Haz0Qg",
        "version": {
          "created": "8050299"
        }
      }
    }
  }
}

conclusion : Index has 1 primary and 1 replica shard => total 2 shards [ note : shard count can be decided during index creation time. ]

```




# Index Mapping

```
GET index1/_mapping 

response: 
{
  "index1": {
    "mappings": {}
  }
}

```




# Index stats 

```
GET index1/_stats

response : 
{
  "_shards": {
    "total": 2,
    "successful": 1,
    "failed": 0
  },
  "_all": {
    "primaries": {
      "docs": {
        "count": 0,
        "deleted": 0
      },
      "shard_stats": {
        "total_count": 1
      },
      "store": {
        "size_in_bytes": 225,
        "total_data_set_size_in_bytes": 225,
        "reserved_in_bytes": 0
      },
      "indexing": {
        "index_total": 0,
        "index_time_in_millis": 0,
        "index_current": 0,
        "index_failed": 0,
        "delete_total": 0,
        "delete_time_in_millis": 0,
        "delete_current": 0,
        "noop_update_total": 0,
        "is_throttled": false,
        "throttle_time_in_millis": 0
      },
      "get": {
        "total": 0,
        "time_in_millis": 0,
        "exists_total": 0,
        "exists_time_in_millis": 0,
        "missing_total": 0,
        "missing_time_in_millis": 0,
        "current": 0
      },
      "search": {
        "open_contexts": 0,
        "query_total": 0,
        "query_time_in_millis": 0,
        "query_current": 0,
        "fetch_total": 0,
        "fetch_time_in_millis": 0,
        "fetch_current": 0,
        "scroll_total": 0,
        "scroll_time_in_millis": 0,
        "scroll_current": 0,
        "suggest_total": 0,
        "suggest_time_in_millis": 0,
        "suggest_current": 0
      },
      "merges": {
        "current": 0,
        "current_docs": 0,
        "current_size_in_bytes": 0,
        "total": 0,
        "total_time_in_millis": 0,
        "total_docs": 0,
        "total_size_in_bytes": 0,
        "total_stopped_time_in_millis": 0,
        "total_throttled_time_in_millis": 0,
        "total_auto_throttle_in_bytes": 20971520
      },
      "refresh": {
        "total": 2,
        "total_time_in_millis": 0,
        "external_total": 2,
        "external_total_time_in_millis": 0,
        "listeners": 0
      },
      "flush": {
        "total": 0,
        "periodic": 0,
        "total_time_in_millis": 0
      },
      "warmer": {
        "current": 0,
        "total": 1,
        "total_time_in_millis": 0
      },
      "query_cache": {
        "memory_size_in_bytes": 0,
        "total_count": 0,
        "hit_count": 0,
        "miss_count": 0,
        "cache_size": 0,
        "cache_count": 0,
        "evictions": 0
      },
      "fielddata": {
        "memory_size_in_bytes": 0,
        "evictions": 0
      },
      "completion": {
        "size_in_bytes": 0
      },
      "segments": {
        "count": 0,
        "memory_in_bytes": 0,
        "terms_memory_in_bytes": 0,
        "stored_fields_memory_in_bytes": 0,
        "term_vectors_memory_in_bytes": 0,
        "norms_memory_in_bytes": 0,
        "points_memory_in_bytes": 0,
        "doc_values_memory_in_bytes": 0,
        "index_writer_memory_in_bytes": 0,
        "version_map_memory_in_bytes": 0,
        "fixed_bit_set_memory_in_bytes": 0,
        "max_unsafe_auto_id_timestamp": -1,
        "file_sizes": {}
      },
      "translog": {
        "operations": 0,
        "size_in_bytes": 55,
        "uncommitted_operations": 0,
        "uncommitted_size_in_bytes": 55,
        "earliest_last_modified_age": 66793
      },
      "request_cache": {
        "memory_size_in_bytes": 0,
        "evictions": 0,
        "hit_count": 0,
        "miss_count": 0
      },
      "recovery": {
        "current_as_source": 0,
        "current_as_target": 0,
        "throttle_time_in_millis": 0
      },
      "bulk": {
        "total_operations": 0,
        "total_time_in_millis": 0,
        "total_size_in_bytes": 0,
        "avg_time_in_millis": 0,
        "avg_size_in_bytes": 0
      }
    },
    "total": {
      "docs": {
        "count": 0,
        "deleted": 0
      },
      "shard_stats": {
        "total_count": 1
      },
      "store": {
        "size_in_bytes": 225,
        "total_data_set_size_in_bytes": 225,
        "reserved_in_bytes": 0
      },
      "indexing": {
        "index_total": 0,
        "index_time_in_millis": 0,
        "index_current": 0,
        "index_failed": 0,
        "delete_total": 0,
        "delete_time_in_millis": 0,
        "delete_current": 0,
        "noop_update_total": 0,
        "is_throttled": false,
        "throttle_time_in_millis": 0
      },
      "get": {
        "total": 0,
        "time_in_millis": 0,
        "exists_total": 0,
        "exists_time_in_millis": 0,
        "missing_total": 0,
        "missing_time_in_millis": 0,
        "current": 0
      },
      "search": {
        "open_contexts": 0,
        "query_total": 0,
        "query_time_in_millis": 0,
        "query_current": 0,
        "fetch_total": 0,
        "fetch_time_in_millis": 0,
        "fetch_current": 0,
        "scroll_total": 0,
        "scroll_time_in_millis": 0,
        "scroll_current": 0,
        "suggest_total": 0,
        "suggest_time_in_millis": 0,
        "suggest_current": 0
      },
      "merges": {
        "current": 0,
        "current_docs": 0,
        "current_size_in_bytes": 0,
        "total": 0,
        "total_time_in_millis": 0,
        "total_docs": 0,
        "total_size_in_bytes": 0,
        "total_stopped_time_in_millis": 0,
        "total_throttled_time_in_millis": 0,
        "total_auto_throttle_in_bytes": 20971520
      },
      "refresh": {
        "total": 2,
        "total_time_in_millis": 0,
        "external_total": 2,
        "external_total_time_in_millis": 0,
        "listeners": 0
      },
      "flush": {
        "total": 0,
        "periodic": 0,
        "total_time_in_millis": 0
      },
      "warmer": {
        "current": 0,
        "total": 1,
        "total_time_in_millis": 0
      },
      "query_cache": {
        "memory_size_in_bytes": 0,
        "total_count": 0,
        "hit_count": 0,
        "miss_count": 0,
        "cache_size": 0,
        "cache_count": 0,
        "evictions": 0
      },
      "fielddata": {
        "memory_size_in_bytes": 0,
        "evictions": 0
      },
      "completion": {
        "size_in_bytes": 0
      },
      "segments": {
        "count": 0,
        "memory_in_bytes": 0,
        "terms_memory_in_bytes": 0,
        "stored_fields_memory_in_bytes": 0,
        "term_vectors_memory_in_bytes": 0,
        "norms_memory_in_bytes": 0,
        "points_memory_in_bytes": 0,
        "doc_values_memory_in_bytes": 0,
        "index_writer_memory_in_bytes": 0,
        "version_map_memory_in_bytes": 0,
        "fixed_bit_set_memory_in_bytes": 0,
        "max_unsafe_auto_id_timestamp": -1,
        "file_sizes": {}
      },
      "translog": {
        "operations": 0,
        "size_in_bytes": 55,
        "uncommitted_operations": 0,
        "uncommitted_size_in_bytes": 55,
        "earliest_last_modified_age": 66793
      },
      "request_cache": {
        "memory_size_in_bytes": 0,
        "evictions": 0,
        "hit_count": 0,
        "miss_count": 0
      },
      "recovery": {
        "current_as_source": 0,
        "current_as_target": 0,
        "throttle_time_in_millis": 0
      },
      "bulk": {
        "total_operations": 0,
        "total_time_in_millis": 0,
        "total_size_in_bytes": 0,
        "avg_time_in_millis": 0,
        "avg_size_in_bytes": 0
      }
    }
  },
  "indices": {
    "index1": {
      "uuid": "mptK9UqbR9mpM4N1Haz0Qg",
      "health": "yellow",
      "status": "open",
      "primaries": {
        "docs": {
          "count": 0,
          "deleted": 0
        },
        "shard_stats": {
          "total_count": 1
        },
        "store": {
          "size_in_bytes": 225,
          "total_data_set_size_in_bytes": 225,
          "reserved_in_bytes": 0
        },
        "indexing": {
          "index_total": 0,
          "index_time_in_millis": 0,
          "index_current": 0,
          "index_failed": 0,
          "delete_total": 0,
          "delete_time_in_millis": 0,
          "delete_current": 0,
          "noop_update_total": 0,
          "is_throttled": false,
          "throttle_time_in_millis": 0
        },
        "get": {
          "total": 0,
          "time_in_millis": 0,
          "exists_total": 0,
          "exists_time_in_millis": 0,
          "missing_total": 0,
          "missing_time_in_millis": 0,
          "current": 0
        },
        "search": {
          "open_contexts": 0,
          "query_total": 0,
          "query_time_in_millis": 0,
          "query_current": 0,
          "fetch_total": 0,
          "fetch_time_in_millis": 0,
          "fetch_current": 0,
          "scroll_total": 0,
          "scroll_time_in_millis": 0,
          "scroll_current": 0,
          "suggest_total": 0,
          "suggest_time_in_millis": 0,
          "suggest_current": 0
        },
        "merges": {
          "current": 0,
          "current_docs": 0,
          "current_size_in_bytes": 0,
          "total": 0,
          "total_time_in_millis": 0,
          "total_docs": 0,
          "total_size_in_bytes": 0,
          "total_stopped_time_in_millis": 0,
          "total_throttled_time_in_millis": 0,
          "total_auto_throttle_in_bytes": 20971520
        },
        "refresh": {
          "total": 2,
          "total_time_in_millis": 0,
          "external_total": 2,
          "external_total_time_in_millis": 0,
          "listeners": 0
        },
        "flush": {
          "total": 0,
          "periodic": 0,
          "total_time_in_millis": 0
        },
        "warmer": {
          "current": 0,
          "total": 1,
          "total_time_in_millis": 0
        },
        "query_cache": {
          "memory_size_in_bytes": 0,
          "total_count": 0,
          "hit_count": 0,
          "miss_count": 0,
          "cache_size": 0,
          "cache_count": 0,
          "evictions": 0
        },
        "fielddata": {
          "memory_size_in_bytes": 0,
          "evictions": 0
        },
        "completion": {
          "size_in_bytes": 0
        },
        "segments": {
          "count": 0,
          "memory_in_bytes": 0,
          "terms_memory_in_bytes": 0,
          "stored_fields_memory_in_bytes": 0,
          "term_vectors_memory_in_bytes": 0,
          "norms_memory_in_bytes": 0,
          "points_memory_in_bytes": 0,
          "doc_values_memory_in_bytes": 0,
          "index_writer_memory_in_bytes": 0,
          "version_map_memory_in_bytes": 0,
          "fixed_bit_set_memory_in_bytes": 0,
          "max_unsafe_auto_id_timestamp": -1,
          "file_sizes": {}
        },
        "translog": {
          "operations": 0,
          "size_in_bytes": 55,
          "uncommitted_operations": 0,
          "uncommitted_size_in_bytes": 55,
          "earliest_last_modified_age": 66793
        },
        "request_cache": {
          "memory_size_in_bytes": 0,
          "evictions": 0,
          "hit_count": 0,
          "miss_count": 0
        },
        "recovery": {
          "current_as_source": 0,
          "current_as_target": 0,
          "throttle_time_in_millis": 0
        },
        "bulk": {
          "total_operations": 0,
          "total_time_in_millis": 0,
          "total_size_in_bytes": 0,
          "avg_time_in_millis": 0,
          "avg_size_in_bytes": 0
        }
      },
      "total": {
        "docs": {
          "count": 0,
          "deleted": 0
        },
        "shard_stats": {
          "total_count": 1
        },
        "store": {
          "size_in_bytes": 225,
          "total_data_set_size_in_bytes": 225,
          "reserved_in_bytes": 0
        },
        "indexing": {
          "index_total": 0,
          "index_time_in_millis": 0,
          "index_current": 0,
          "index_failed": 0,
          "delete_total": 0,
          "delete_time_in_millis": 0,
          "delete_current": 0,
          "noop_update_total": 0,
          "is_throttled": false,
          "throttle_time_in_millis": 0
        },
        "get": {
          "total": 0,
          "time_in_millis": 0,
          "exists_total": 0,
          "exists_time_in_millis": 0,
          "missing_total": 0,
          "missing_time_in_millis": 0,
          "current": 0
        },
        "search": {
          "open_contexts": 0,
          "query_total": 0,
          "query_time_in_millis": 0,
          "query_current": 0,
          "fetch_total": 0,
          "fetch_time_in_millis": 0,
          "fetch_current": 0,
          "scroll_total": 0,
          "scroll_time_in_millis": 0,
          "scroll_current": 0,
          "suggest_total": 0,
          "suggest_time_in_millis": 0,
          "suggest_current": 0
        },
        "merges": {
          "current": 0,
          "current_docs": 0,
          "current_size_in_bytes": 0,
          "total": 0,
          "total_time_in_millis": 0,
          "total_docs": 0,
          "total_size_in_bytes": 0,
          "total_stopped_time_in_millis": 0,
          "total_throttled_time_in_millis": 0,
          "total_auto_throttle_in_bytes": 20971520
        },
        "refresh": {
          "total": 2,
          "total_time_in_millis": 0,
          "external_total": 2,
          "external_total_time_in_millis": 0,
          "listeners": 0
        },
        "flush": {
          "total": 0,
          "periodic": 0,
          "total_time_in_millis": 0
        },
        "warmer": {
          "current": 0,
          "total": 1,
          "total_time_in_millis": 0
        },
        "query_cache": {
          "memory_size_in_bytes": 0,
          "total_count": 0,
          "hit_count": 0,
          "miss_count": 0,
          "cache_size": 0,
          "cache_count": 0,
          "evictions": 0
        },
        "fielddata": {
          "memory_size_in_bytes": 0,
          "evictions": 0
        },
        "completion": {
          "size_in_bytes": 0
        },
        "segments": {
          "count": 0,
          "memory_in_bytes": 0,
          "terms_memory_in_bytes": 0,
          "stored_fields_memory_in_bytes": 0,
          "term_vectors_memory_in_bytes": 0,
          "norms_memory_in_bytes": 0,
          "points_memory_in_bytes": 0,
          "doc_values_memory_in_bytes": 0,
          "index_writer_memory_in_bytes": 0,
          "version_map_memory_in_bytes": 0,
          "fixed_bit_set_memory_in_bytes": 0,
          "max_unsafe_auto_id_timestamp": -1,
          "file_sizes": {}
        },
        "translog": {
          "operations": 0,
          "size_in_bytes": 55,
          "uncommitted_operations": 0,
          "uncommitted_size_in_bytes": 55,
          "earliest_last_modified_age": 66793
        },
        "request_cache": {
          "memory_size_in_bytes": 0,
          "evictions": 0,
          "hit_count": 0,
          "miss_count": 0
        },
        "recovery": {
          "current_as_source": 0,
          "current_as_target": 0,
          "throttle_time_in_millis": 0
        },
        "bulk": {
          "total_operations": 0,
          "total_time_in_millis": 0,
          "total_size_in_bytes": 0,
          "avg_time_in_millis": 0,
          "avg_size_in_bytes": 0
        }
      }
    }
  }
}


```
