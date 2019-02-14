# Dynamic Dashboards

---

## Template Creation & Preparation

Start by creating and exporting your basic dashboard from Grafana. 

Be sure to create a variable to reference for host-name comparisons, as it will come in handy later.

### Datasource Prep

When importing dashboards via the configmap process (explained later), the datasource name is not automatically generated by Grafana. Therefore, you will have to manually replace any reference to the datasource variable.

   1. You'll need to find any occurrences of `${DS_INFLUXDB}` or `${DS_INFLUX}`.
   
   2. Generally they will be found in the `panels` list, on lines like `"datasource": "${DS_INFLUX}"`.

   3. Change each occurrence of `${DS_INFLUX}` to `influx`.

If you have a differing datasource, follow the below.
   
   1. Find the `__inputs` section, at the top of the exported dashboard file.

   2. The `name` of the input should follow the pattern of `DS_INPUT`.

   3. Below that will be a `label`.

   4. Use the value of that `label` and replace any occurrence of `${DS_INPUT}`

### Host Prep

If you take a look at `systemDashboardTemplate.txt`, you should notice that there are numerous references to `WATCHEDNODE` in host-name comparisons. 

> Ex. `SELECT x FROM y WHERE (\"host\" =~ /WATCHEDNODE/) . . .`

If you made a variable for your host names, and have a somewhat sophisticated IDE, you should be able to easily replace all occurrences of the name to `WATCHEDNODE`.

> You may also utilize a different identifier, but we recommend what is used in `generateDashboards.sh` for consistency.

### Generation Script Prep

To incorporate your new dashboard template into the Dynamic Generation process, you will have to add in your own function to create dashboard files from the template.

The general algorithm is as follows, but we recommend you follow along in [`generatedashboards.sh`](https://github.com/Eliforbes42/cronus-monitoring/blob/master/scripts/generateDashboards.sh)

    yourDashGenFn() {
    - Store Node Variable from argument $1
    - Create your unique dashboard name
    - Replace host names with Node variable, write to generatedDashboards/uniqueName-metrics.json
    - Create unique dashboard id
    - Replace UID in created file (Your original dashboard UID may vary)
    - Notify user of dashboard creation
    }

---

## Configmap Explanation

In the `grafana` chart, you will find the values file `grafana/values.yaml`

About 3/4ths of the way through, you'll find the following

> dashboardsConfigMaps: 
    default: "all-dashboards"

This refers to the `all-dashboard-configmap`, found in [`grafana/templates/all-dashboard-configmap.yaml`](https://github.com/Eliforbes42/cronus-monitoring/blob/master/charts/grafana/templates/all-dashboard-configmap.yaml)

The main bit of logic in this configmap is as follows: 

> `{{ (.Files.Glob "dashboards/*.json").AsConfig | indent 2 }}`

This imports the JSON dashboards contained within `grafana/dashboards` as their own configmaps.