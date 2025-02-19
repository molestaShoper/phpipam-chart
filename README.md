# phpipam

![Version: 1.0.4](https://img.shields.io/badge/Version-1.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.7.3](https://img.shields.io/badge/AppVersion-1.7.3-informational?style=flat-square)

phpipam is an open-source web IP address management application (IPAM)

**Homepage:** <https://phpipam.net>

## Source Code

* <https://github.com/molestaShoper/phpipam-chart>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cron.image.pullPolicy | string | `"IfNotPresent"` |  |
| cron.image.repository | string | `"phpipam/phpipam-cron"` |  |
| cron.image.tag | string | `"v1.7.3"` |  |
| cron.name | string | `"phpipam-cron"` |  |
| cron.resources.limits.cpu | string | `"1000m"` |  |
| cron.resources.limits.memory | string | `"2048Mi"` |  |
| cron.resources.requests.cpu | string | `"50m"` |  |
| cron.resources.requests.memory | string | `"32Mi"` |  |
| cron.scan_interval | string | `"1h"` |  |
| database.image.pullPolicy | string | `"IfNotPresent"` |  |
| database.image.repository | string | `"percona/percona-server"` |  |
| database.image.tag | string | `"8.0.40"` |  |
| database.installed | bool | `true` |  |
| database.name | string | `"phpipam-db"` |  |
| database.persistence.enabled | bool | `true` |  |
| database.persistence.size | string | `"15Gi"` |  |
| database.persistence.storageClassName | string | `""` |  |
| database.resources.limits.cpu | string | `"1000m"` |  |
| database.resources.limits.memory | string | `"2048Mi"` |  |
| database.resources.requests.cpu | string | `"50m"` |  |
| database.resources.requests.memory | string | `"128Mi"` |  |
| database.service.port | int | `3306` |  |
| database.service.type | string | `"ClusterIP"` |  |
| global.database.name | string | `"phpipam"` |  |
| global.database.password | string | `"phpipam"` |  |
| global.database.user | string | `"phpipam"` |  |
| global.domain | string | `"chart-example.local"` | domain of this phpipam instance |
| global.podAnnotations | object | `{}` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| phpipam.image.pullPolicy | string | `"IfNotPresent"` |  |
| phpipam.image.replicaCount | int | `1` |  |
| phpipam.image.repository | string | `"phpipam/phpipam-www"` |  |
| phpipam.image.tag | string | `"v1.7.3"` |  |
| phpipam.name | string | `"phpipam-web"` |  |
| phpipam.resources.limits.cpu | string | `"1000m"` |  |
| phpipam.resources.limits.memory | string | `"2048Mi"` |  |
| phpipam.resources.requests.cpu | string | `"50m"` |  |
| phpipam.resources.requests.memory | string | `"32Mi"` |  |
| phpipam.service.port | int | `80` |  |
| phpipam.service.type | string | `"ClusterIP"` |  |
| phpipam.widgets | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
