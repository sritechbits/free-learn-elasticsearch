URL : https://www.elastic.co/training/elastic-certified-engineer-exam

Topics
Elastic Certified Engineer exam is currently on version 8.1.

 

Data Management 👍

1. Define an index that satisfies a given set of requirements
2. Define and use an index template for a given pattern that satisfies a given set of requirements
3. Define and use a dynamic template that satisfies a given set of requirements
4. Define an Index Lifecycle Management policy for a time-series index
5. Define an index template that creates a new data stream


# Define an index that satisfies a given set of requirements

Ques : Complete the assignment and explain in what scenario you will use it ?
   1. create an index with 10,15,20 primary shards and compare it with default behaviour 
   2. create an index with more than 1 replica shard
   3. create an index which rejects the document that doesn't follow the defined schema while creation. 
   4. create an index which has refresh rate of 100seconds ( when you don't want near real time search ) and compare it with default behaviour
   5. 

```
PUT index10 
{
  "settings": {
    "number_of_shards": 10
  }
}

check stats after creation : 

GET index10/_stats

{
  "_shards": {
    "total": 20,
    "successful": 10,
    "failed": 0
  },
  "_all": {
    "primaries": {
      "docs": {
        "count": 0,
        "deleted": 0
      },
      "shard_stats": {
        "total_count": 10
      },
      "store": {
        "size_in_bytes": 2250,
        "total_data_set_size_in_bytes": 2250,
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
        "total_auto_throttle_in_bytes": 209715200
      },
      "refresh": {
        "total": 20,
        "total_time_in_millis": 0,
        "external_total": 20,
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
        "total": 10,
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
        "size_in_bytes": 550,
        "uncommitted_operations": 0,
        "uncommitted_size_in_bytes": 550,
        "earliest_last_modified_age": 1276
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
        "total_count": 10
      },
      "store": {
        "size_in_bytes": 2250,
        "total_data_set_size_in_bytes": 2250,
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
        "total_auto_throttle_in_bytes": 209715200
      },
      "refresh": {
        "total": 20,
        "total_time_in_millis": 0,
        "external_total": 20,
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
        "total": 10,
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
        "size_in_bytes": 550,
        "uncommitted_operations": 0,
        "uncommitted_size_in_bytes": 550,
        "earliest_last_modified_age": 1276
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
    "index10": {
      "uuid": "5nKZuD-4RNCpwIbRF7eFww",
      "health": "yellow",
      "status": "open",
      "primaries": {
        "docs": {
          "count": 0,
          "deleted": 0
        },
        "shard_stats": {
          "total_count": 10
        },
        "store": {
          "size_in_bytes": 2250,
          "total_data_set_size_in_bytes": 2250,
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
          "total_auto_throttle_in_bytes": 209715200
        },
        "refresh": {
          "total": 20,
          "total_time_in_millis": 0,
          "external_total": 20,
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
          "total": 10,
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
          "size_in_bytes": 550,
          "uncommitted_operations": 0,
          "uncommitted_size_in_bytes": 550,
          "earliest_last_modified_age": 1276
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
          "total_count": 10
        },
        "store": {
          "size_in_bytes": 2250,
          "total_data_set_size_in_bytes": 2250,
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
          "total_auto_throttle_in_bytes": 209715200
        },
        "refresh": {
          "total": 20,
          "total_time_in_millis": 0,
          "external_total": 20,
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
          "total": 10,
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
          "size_in_bytes": 550,
          "uncommitted_operations": 0,
          "uncommitted_size_in_bytes": 550,
          "earliest_last_modified_age": 1276
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




```
GET index10/_settings

response : 
{
  "index10": {
    "settings": {
      "index": {
        "routing": {
          "allocation": {
            "include": {
              "_tier_preference": "data_content"
            }
          }
        },
        "number_of_shards": "10",
        "provided_name": "index10",
        "creation_date": "1676189076369",
        "number_of_replicas": "2",
        "uuid": "p0Cgva6cTQ-vnJfD_A26-g",
        "version": {
          "created": "8050299"
        }
      }
    }
  }
}

```


```
PUT index10 
{
  "settings": {
    "number_of_shards": 10,
    "number_of_replicas": 2
  }
}

```