#!/bin/bash
KURL=$(sudo kubectl get svc --namespace kube-system alerts-kapacitor -o json | jq -r .spec.clusterIP)
IURL=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)
echo $KURL:9092
kapacitor-unit -kapacitor http://$KURL:9092 -influxdb http://$IURL:8086 -dir ../gtikk-charts/kapacitor/TICKscripts/stream -tests ../gtikk-charts/kapacitor/TICKscripts/tests/all_tests.yaml