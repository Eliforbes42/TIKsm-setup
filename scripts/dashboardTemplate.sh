'{
  "__inputs": [
    {
      "name": "DS_INFLUX",
      "label": "influx",
      "description": "",
      "type": "datasource",
      "pluginId": "influxdb",
      "pluginName": "InfluxDB"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "5.3.2"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": "5.0.0"
    },
    {
      "type": "datasource",
      "id": "influxdb",
      "name": "InfluxDB",
      "version": "5.0.0"
    },
    {
      "type": "panel",
      "id": "singlestat",
      "name": "Singlestat",
      "version": "5.0.0"
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "InfluxDB dashboards for telegraf metrics",
  "editable": true,
  "gnetId": 5955,
  "graphTooltip": 1,
  "id": null,
  "iteration": 1542176249705,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 65099,
      "panels": [],
      "title": "kube-node1 SYSTEM - CPU, Memory, Disk, Network",
      "type": "row"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "format": "s",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 0,
        "y": 1
      },
      "id": 65078,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "hide": false,
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT last(\"uptime_format\") AS \"value\" FROM \"system\" WHERE \"host\" =~ \'WATCHEDNODE\'",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "",
      "title": "Uptime",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": null,
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 4,
        "y": 1
      },
      "id": 65081,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(\"n_cpus\") AS \"mean_n_cpus\" FROM \"system\"  WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval) fill(null) ",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "",
      "title": "CPUs",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": true,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 6,
        "y": 1
      },
      "id": 65079,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT last(\"used_percent\") FROM \"disk\" WHERE (\"host\" =~ \'WATCHEDNODE\' AND \"path\" = '/') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "70,80,90",
      "title": "Root FS Used",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 8,
        "y": 1
      },
      "id": 65080,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT last(\"load5\") FROM \"system\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "3,7,10",
      "title": "LA (Medium)",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": null,
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": true,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 10,
        "y": 1
      },
      "id": 65082,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT last(\"usage_idle\") * -1 + 100 FROM \"cpu\" WHERE (\"host\" =~ \'WATCHEDNODE\' AND \"cpu\" = 'cpu-total') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "70,80,90",
      "title": "CPU usage",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": null,
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": true,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 12,
        "y": 1
      },
      "id": 65083,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT last(\"used_percent\") FROM \"mem\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "70,80,90",
      "title": "RAM usage",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": 2,
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 14,
        "y": 1
      },
      "id": 65084,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "\nSELECT mean(\"usage_iowait\") FROM \"cpu\" WHERE (\"host\" =~ \'WATCHEDNODE\' AND \"cpu\" = 'cpu-total') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "70,80,90",
      "title": "IOWait",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": 0,
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 16,
        "y": 1
      },
      "id": 65085,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "\nSELECT last(\"total\") FROM \"processes\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "1,5,10",
      "title": "Processes",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": 0,
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 18,
        "y": 1
      },
      "id": 65086,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "\nSELECT last(\"total_threads\") FROM \"processes\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "1,5,10",
      "title": "Threads",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": true,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "influx",
      "decimals": null,
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 2,
        "x": 20,
        "y": 1
      },
      "id": 65088,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT last(\"n_users\") FROM \"system\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": "20,50",
      "title": "Users",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 0,
        "y": 4
      },
      "id": 65092,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": false,
        "hideZero": true,
        "max": true,
        "min": true,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "hide": false,
          "measurement": "cpu_percentageBusy",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(usage_user) as \"user\", mean(usage_system) as \"system\", mean(usage_softirq) as \"softirq\", mean(usage_steal) as \"steal\", mean(usage_nice) as \"nice\", mean(usage_irq) as \"irq\", mean(usage_iowait) as \"iowait\", mean(usage_guest) as \"guest\", mean(usage_guest_nice) as \"guest_nice\"  FROM \"cpu\" WHERE \"host\" =~ \'WATCHEDNODE\' and cpu = 'cpu-total' AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "CPU Usage",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percent",
          "logBase": 1,
          "max": 100,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 0,
      "grid": {},
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 12,
        "y": 4
      },
      "id": 54694,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": null,
        "sortDesc": null,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "system_load1",
          "policy": "default",
          "query": "SELECT mean(load1) as load1,mean(load5) as load5,mean(load15) as load15 FROM \"system\" WHERE host =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval), * ORDER BY asc",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "CPU Load",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 10,
        "w": 24,
        "x": 0,
        "y": 14
      },
      "id": 12054,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/mem_total/",
          "color": "#BF1B00",
          "fill": 0,
          "linewidth": 2
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "mem_inactive",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(total) as total, mean(used) as used, mean(cached) as cached, mean(free) as free, mean(buffered) as buffered  FROM \"mem\" WHERE host =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval), host ORDER BY asc",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Memory usage",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 24
      },
      "id": 28239,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": false,
        "hideZero": true,
        "max": true,
        "min": false,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "hide": false,
          "measurement": "cpu_percentageBusy",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(running) as running, mean(blocked) as blocked, mean(sleeping) as sleeping, mean(stopped) as stopped, mean(zombies) as zombies, mean(paging) as paging, mean(unknown) as unknown FROM \"processes\" WHERE host =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval), host ORDER BY asc",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Processes",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 24
      },
      "id": 65097,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": false,
        "hideZero": true,
        "max": true,
        "min": false,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "hide": false,
          "measurement": "cpu_percentageBusy",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(context_switches),1s)as \"context switches\"  FROM \"kernel\" WHERE host =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval), host ORDER BY asc",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Context Switches",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "ops",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 32
      },
      "id": 52240,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "disk.total",
          "color": "#BF1B00",
          "fill": 0,
          "linewidth": 2,
          "zindex": 3
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_host: $tag_path : $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "disk_total",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(total) AS \"total\", mean(used) as \"used\", mean(free) as \"free\" FROM \"disk\" WHERE \"host\" =~ \'WATCHEDNODE\' AND \"path\" = '/' AND $timeFilter GROUP BY time($interval), \"host\", \"path\"",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Root Disk usage (/)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "bytes",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 32
      },
      "id": 65090,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "disk.used_percent",
          "color": "#BF1B00",
          "fill": 0,
          "linewidth": 2,
          "zindex": 3
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_path ($tag_fstype on $tag_device)",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "disk_total",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(\"used_percent\") AS \"used_percent\" FROM \"disk\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval), \"path\", \"device\", \"fstype\" fill(null)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "All partitions usage (%)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percent",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "percent",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 40
      },
      "id": 33458,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": false,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/used/",
          "color": "#BF1B00",
          "zindex": 3
        },
        {
          "alias": "/free/",
          "bars": false,
          "fill": 0,
          "lines": true,
          "linewidth": 1
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_host: $tag_path : $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "disk_inodes_free",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(inodes_total) as \"total\", mean(inodes_free) as \"free\", mean(inodes_used) as \"used\" FROM \"disk\" WHERE \"host\" =~ \'WATCHEDNODE\' AND \"path\" = '/' AND $timeFilter GROUP BY time($interval), \"host\", \"path\"",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Root (/) Disk inodes",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 10,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 40
      },
      "id": 65091,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "disk.used_percent",
          "color": "#BF1B00",
          "fill": 0,
          "linewidth": 2,
          "zindex": 3
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_path ($tag_fstype on $tag_device)",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "disk_total",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(\"inodes_free\") AS \"free\" FROM \"disk\" WHERE (\"host\" =~ \'WATCHEDNODE\') AND $timeFilter GROUP BY time($interval), \"path\", \"device\", \"fstype\" fill(null)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "All partitions Inodes (Free)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 48
      },
      "id": 13782,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": true,
        "max": true,
        "min": true,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_host: $tag_name: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "io_reads",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(reads),1s) as \"read\" FROM \"diskio\" WHERE \"host\" =~ \'WATCHEDNODE\'E\'E\' AND \"name\" =~ /$disk$/ AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_name: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "io_reads",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "\nSELECT non_negative_derivative(mean(writes),1s) as \"write\" FROM \"diskio\" WHERE \"host\" =~ \'WATCHEDNODE\'E\'E\'E\'E\' AND \"name\" =~ /$disk$/  AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "C",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Disk I/O requests",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "iops",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 48
      },
      "id": 56720,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": true,
        "max": true,
        "min": true,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/read/",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_host: $tag_name: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "io_reads",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(read_time),1s) as \"read\" FROM \"diskio\" WHERE \"host\" =~ \'WATCHEDNODE\' AND \"name\" =~ /$disk$/  AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_name: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "io_reads",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(write_time),1s) as \"write\" FROM \"diskio\" WHERE \"host\" =~ \'WATCHEDNODE\' AND \"name\" =~ /$disk$/ AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Disk I/O time",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "ms",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 56
      },
      "id": 60200,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": true,
        "max": true,
        "min": true,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/read/",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "alias": "$tag_host: $tag_name: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "io_reads",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(read_bytes),1s) as \"read\" FROM \"diskio\" WHERE \"host\" =~ \'WATCHEDNODE\' AND \"name\" =~ /$disk$/ AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_name: $col",
          "dsType": "influx",
          "function": "mean",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "path",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "io_reads",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(write_bytes),1s) as \"write\" FROM \"diskio\" WHERE \"host\" =~ \'WATCHEDNODE\' AND \"name\" =~ /$disk$/ AND $timeFilter GROUP BY time($interval), *",
          "rawQuery": true,
          "refId": "C",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Disk I/O bytes",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 24,
        "x": 0,
        "y": 64
      },
      "id": 28572,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/ in$/",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(packets_recv), 1s) as \"in\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), * fill(none)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(packets_sent), 1s) as \"out\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), * fill(none)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Network Packets",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "pps",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 24,
        "x": 0,
        "y": 72
      },
      "id": 42026,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/ in$/",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(bytes_recv),1s)*8 as \"in\"  FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), * fill(none)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(bytes_sent),1s)*8 as \"out\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), * fill(none)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Network Usage",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bps",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 80
      },
      "id": 65093,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": true,
        "hideZero": true,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT mean(tcp_close) as CLOSED, mean(tcp_close_wait) as CLOSE_WAIT, mean(tcp_closing) as CLOSING, mean(tcp_established) as ESTABLISHED, mean(tcp_fin_wait1) as FIN_WAIT1, mean(tcp_fin_wait2) as FIN_WAIT2, mean(tcp_last_ack) as LAST_ACK, mean(tcp_syn_recv) as SYN_RECV, mean(tcp_syn_sent) as SYN_SENT, mean(tcp_time_wait) as TIME_WAIT FROM \"netstat\" WHERE host =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval), host ORDER BY asc",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "TCP connections",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 87
      },
      "id": 65094,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": true,
        "hideZero": true,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(tcp_outrsts), 1s) FROM \"net\" WHERE \"host\" =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(tcp_activeopens), 1s) FROM \"net\" WHERE \"host\" =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(tcp_estabresets), 1s) FROM \"net\" WHERE \"host\" =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "C",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "groupBy": [
            {
              "params": [
                "$__interval"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(tcp_passiveopens), 1s) FROM \"net\" WHERE \"host\" =~ \'WATCHEDNODE\' AND $timeFilter GROUP BY time($interval) fill(null)",
          "rawQuery": true,
          "refId": "D",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "TCP handshake issues",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 94
      },
      "id": 58901,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": false,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(drop_in), 1s) as \"in\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), host,interface fill(none)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(drop_out), 1s) as \"out\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), host,interface fill(none)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Packets Drop",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": "Packets drop",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "influx",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 94
      },
      "id": 50643,
      "interval": "$inter",
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": false,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(err_in), 1s) as \"in\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), host,interface fill(none)",
          "rawQuery": true,
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        },
        {
          "alias": "$tag_host: $tag_interface: $col",
          "dsType": "influx",
          "function": "derivative",
          "groupBy": [
            {
              "interval": "auto",
              "params": [
                "auto"
              ],
              "type": "time"
            },
            {
              "key": "host",
              "params": [
                "tag"
              ],
              "type": "tag"
            },
            {
              "key": "interface",
              "params": [
                "tag"
              ],
              "type": "tag"
            }
          ],
          "measurement": "net_bytes_recv",
          "orderByTime": "ASC",
          "policy": "default",
          "query": "SELECT non_negative_derivative(mean(err_out), 1s) as \"out\" FROM \"net\" WHERE host =~ \'WATCHEDNODE\' AND interface =~ /$interface/ AND $timeFilter GROUP BY time($interval), host,interface fill(none)",
          "rawQuery": true,
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "value"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": []
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Packets Error",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": "Packets drop",
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": false,
  "schemaVersion": 16,
  "style": "dark",
  "tags": [
    "influx",
    "telegraf"
  ],
  "templating": {
    "list": [
      {
        "allFormat": "glob",
        "current": {
          "text": "influx",
          "value": "influx"
        },
        "datasource": "influx",
        "hide": 0,
        "includeAll": false,
        "label": "",
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "influxdb",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "influx",
        "hide": 0,
        "includeAll": false,
        "label": "Server",
        "multi": true,
        "name": "server",
        "options": [],
        "query": "SHOW TAG VALUES FROM system WITH KEY=host",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "auto": true,
        "auto_count": 100,
        "auto_min": "30s",
        "current": {
          "text": "auto",
          "value": "$__auto_interval_inter"
        },
        "datasource": null,
        "hide": 0,
        "includeAll": false,
        "label": "Interval",
        "multi": false,
        "name": "inter",
        "options": [
          {
            "selected": true,
            "text": "auto",
            "value": "$__auto_interval_inter"
          },
          {
            "selected": false,
            "text": "1s",
            "value": "1s"
          },
          {
            "selected": false,
            "text": "5s",
            "value": "5s"
          },
          {
            "selected": false,
            "text": "10s",
            "value": "10s"
          },
          {
            "selected": false,
            "text": "15s",
            "value": "15s"
          },
          {
            "selected": false,
            "text": "30s",
            "value": "30s"
          },
          {
            "selected": false,
            "text": "1m",
            "value": "1m"
          },
          {
            "selected": false,
            "text": "10m",
            "value": "10m"
          },
          {
            "selected": false,
            "text": "30m",
            "value": "30m"
          },
          {
            "selected": false,
            "text": "1h",
            "value": "1h"
          },
          {
            "selected": false,
            "text": "6h",
            "value": "6h"
          },
          {
            "selected": false,
            "text": "12h",
            "value": "12h"
          },
          {
            "selected": false,
            "text": "1d",
            "value": "1d"
          },
          {
            "selected": false,
            "text": "7d",
            "value": "7d"
          },
          {
            "selected": false,
            "text": "14d",
            "value": "14d"
          },
          {
            "selected": false,
            "text": "30d",
            "value": "30d"
          },
          {
            "selected": false,
            "text": "60d",
            "value": "60d"
          },
          {
            "selected": false,
            "text": "90d",
            "value": "90d"
          }
        ],
        "query": "1s,5s,10s,15s,30s,1m,10m,30m,1h,6h,12h,1d,7d,14d,30d,60d,90d",
        "refresh": 2,
        "skipUrlSync": false,
        "type": "interval"
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "$datasource",
        "hide": 0,
        "includeAll": true,
        "label": "CPU",
        "multi": true,
        "name": "cpu",
        "options": [],
        "query": "SHOW TAG VALUES FROM \"cpu\" WITH KEY = \"cpu\" WHERE host =~ \'WATCHEDNODE\'",
        "refresh": 1,
        "regex": "^cpu[0-9].*",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "$datasource",
        "hide": 0,
        "includeAll": true,
        "label": "disk",
        "multi": true,
        "name": "disk",
        "options": [],
        "query": "SHOW TAG VALUES FROM \"disk\" WITH KEY = \"device\"",
        "refresh": 1,
        "regex": "/[a-z]d[\\D]$/",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": true
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "$datasource",
        "hide": 0,
        "includeAll": true,
        "label": "interface",
        "multi": true,
        "name": "interface",
        "options": [],
        "query": "SHOW TAG VALUES FROM \"net\" WITH KEY = \"interface\" WHERE host =~ \'WATCHEDNODE\'",
        "refresh": 1,
        "regex": "^(?!.*veth|all|tap).*",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": true
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "\'WATCHEDNODE\' system metrics",
  "uid": "UCRfGnBmk",
  "version": 1
}'